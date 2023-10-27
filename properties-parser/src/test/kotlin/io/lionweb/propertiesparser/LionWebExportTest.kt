package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.LionWebModelImporterAndExporter
import com.strumenta.kolasu.model.assignParents
import io.lionweb.lioncore.java.serialization.JsonSerialization
import org.junit.Test

class LionWebExportTest {

    @Test
    fun exportMetamodel() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val json = jsonser.serializeTreeToJsonString(PropertiesLWLanguage)
        println(json)
    }

    @Test
    fun exportModel() {
        val ast = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        ast.assignParents()
        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.registerLanguage(PropertiesLWLanguage)

        val exportedAST = ast.toLionWeb()

        val json = jsonser.serializeTreeToJsonString(exportedAST)
        println(json)
    }
}
