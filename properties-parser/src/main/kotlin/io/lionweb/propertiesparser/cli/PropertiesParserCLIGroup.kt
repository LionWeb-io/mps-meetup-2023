@file:JvmName("PropertiesParserCLI")

package io.lionweb.propertiesparser.cli

import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.core.subcommands
import com.github.ajalt.clikt.parameters.arguments.argument
import com.github.ajalt.clikt.parameters.options.default
import com.github.ajalt.clikt.parameters.options.option
import com.github.ajalt.clikt.parameters.types.file
import com.strumenta.kolasu.cli.changeExtension
import com.strumenta.kolasu.model.FileSource
import com.strumenta.kolasu.model.SimpleOrigin
import com.strumenta.kolasu.traversing.walk
import com.strumenta.kolasu.validation.IssueSeverity
import io.lionweb.propertiesparser.Metamodel
import io.lionweb.propertiesparser.PropertiesKolasuParser
import org.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.File
import kotlin.system.exitProcess

class PropertiesParserCLIGroup : CliktCommand() {
    override fun run() = Unit
}

class MetamodelCommand : CliktCommand(
    name = "metamodel",
    help = "Produce the metamodel"
) {
    val output by option("-o", "--output").file(canBeDir = false, canBeFile = true)
        .default(File("properties.lmm.json"))
    override fun run() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val json = jsonser.serializeTreeToJsonString(Metamodel)
        output.writeText(json)
        println("Metamodel of Properties written into ${output.absolutePath}.")
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
        Metamodel.prepareSerialization(jsonser)
        result.root!!.walk().forEach {
            it.detach()
            (it.origin as SimpleOrigin).position!!.source = FileSource(source)
        }
        val json = jsonser.serializeTreeToJsonString(result.root!!)
        val destination = output ?: source.changeExtension("lm.json")
        destination.writeText(json)
        println("AST for ${source.absolutePath} written into ${destination.absolutePath}.")
    }
}

fun main(args: Array<String>) = PropertiesParserCLIGroup()
    .subcommands(MetamodelCommand(), ParsingCommand())
    .main(args)
