@file:JvmName("PropertiesParserCLI")

package io.lionweb.propertiesparser.cli

import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.core.subcommands
import com.github.ajalt.clikt.parameters.arguments.argument
import com.github.ajalt.clikt.parameters.options.default
import com.github.ajalt.clikt.parameters.options.flag
import com.github.ajalt.clikt.parameters.options.option
import com.github.ajalt.clikt.parameters.types.file
import com.strumenta.kolasu.cli.changeExtension
import com.strumenta.kolasu.lionweb.LionWebModelImporterAndExporter
import com.strumenta.kolasu.lionweb.StarLasuLWLanguage
import com.strumenta.kolasu.model.FileSource
import com.strumenta.kolasu.model.SimpleOrigin
import com.strumenta.kolasu.traversing.walk
import com.strumenta.kolasu.validation.IssueSeverity
import io.lionweb.lioncore.java.model.Node
import io.lionweb.lioncore.java.serialization.JsonSerialization
import io.lionweb.propertiesparser.*
import io.lionweb.propertiesparser.PropertiesLWLanguage
import java.io.File
import kotlin.system.exitProcess

class PropertiesParserCLIGroup : CliktCommand() {
    override fun run() = Unit
}

class PropertiesMetamodelCommand : CliktCommand(
    name = "metamodel",
    help = "Produce the properties metamodel"
) {
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)
        .default(File("properties.lmm.json"))
    val combined by option("-c", "--combined").flag(default = false)
    override fun run() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val json = if (combined) {
            jsonser.serializeNodesToJsonString(
                StarLasuLWLanguage.thisAndAllDescendants() +
                    PropertiesLWLanguage.thisAndAllDescendants()
            )
        } else {
            jsonser.serializeTreeToJsonString(PropertiesLWLanguage)
        }
        output.writeText(json)
        println("Metamodel of Properties ${if (combined) " (with StarLasu combined in the same file) " else ""} written into ${output.absolutePath}.")
    }
}

class StarLasuMetamodelCommand : CliktCommand(
    name = "starlasu",
    help = "Produce the StarLasu metamodel"
) {
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)
        .default(File("starlasu.lmm.json"))
    override fun run() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val json = jsonser.serializeTreeToJsonString(StarLasuLWLanguage)
        output.writeText(json)
        println("Metamodel of Starlasu written into ${output.absolutePath}.")
    }
}

class ParsingCommand : CliktCommand(
    name = "parse",
    help = "Parse the given file"
) {
    val source by argument(name = "source file").file(mustExist = true, canBeDir = false)
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)

    override fun run() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(source)
        if (result.issues.isEmpty()) {
            println("File ${source.absolutePath} parsed without any issue")
        } else if (result.issues.none { it.severity == IssueSeverity.ERROR }) {
            println("File ${source.absolutePath} parsed with some issues, but none is fatal")

            result.issues.forEach {
                println(" - $it")
            }
        } else {
            println("File ${source.absolutePath} parsed with fatal issues")

            result.issues.forEach {
                println(" - $it")
            }
            exitProcess(1)
            return
        }

        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.registerLanguage(StarLasuLWLanguage)

        val lwExport = LionWebModelImporterAndExporter()

        val lwRoot: Node = lwExport.export(result.root!!)

        val json = jsonser.serializeTreeToJsonString(lwRoot)
        val destination = output ?: source.changeExtension("lm.json")
        destination.writeText(json)
        println("AST for ${source.absolutePath} written into ${destination.absolutePath}.")
    }
}

class CodeGenCommand : CliktCommand(
    name = "codegen",
    help = "Generate properties code from a model"
) {
    val input by argument(name = "input model").file(mustExist = true, canBeDir = false)
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)

    override fun run() {
        val loader = PropertiesModelLoader()
        val model = loader.loadModel(input)

        val codegen = PropertiesCodeGenerator()
        val destination = output ?: input.changeExtension("props")
        codegen.printToFile(model, destination)

        println("Model in ${input.absolutePath} written into ${destination.absolutePath}.")
    }
}

class TransformCommand : CliktCommand(
    name = "transform",
    help = "Transform the data in a model"
) {
    val source by argument(name = "source file").file(mustExist = true, canBeDir = false)
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)
    val capitalize by option("-c", "--capitalize").flag()
    val double by option("-d", "--double").flag()
    val reverse by option("-r", "--reverse").flag()
    val toString by option("-s", "--to-string").flag()
    val negate by option("-n", "--negate").flag()

    override fun run() {
        val model = PropertiesModelLoader().loadModel(source)
        if (capitalize) capitalize(model)
        if (double) double(model)
        if (negate) negate(model)
        if (reverse) reverse(model)
        if (toString) convertToString(model)

        val destination = output ?: source.changeExtension("transformed.lm.json")

        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.registerLanguage(PropertiesLWLanguage)

        val lwExport = LionWebModelImporterAndExporter()

        val lwRoot: Node = lwExport.export(model)

        val json = jsonser.serializeTreeToJsonString(lwRoot)
        destination.writeText(json)
        println("Model from ${source.absolutePath} transformed into ${destination.absolutePath}.")
    }
}

fun main(args: Array<String>) = PropertiesParserCLIGroup()
    .subcommands(
        StarLasuMetamodelCommand(), PropertiesMetamodelCommand(), ParsingCommand(), CodeGenCommand(),
        TransformCommand()
    )
    .main(args)
