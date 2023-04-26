package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.model.Position
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.traversing.walk
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

class LionWebExportTest {

    @Test
    fun exportMetamodel() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val json = jsonser.serializeTreeToJsonString(Metamodel)
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
        Metamodel.prepareSerialization(jsonser)
        val json = jsonser.serializeTreeToJsonString(ast)
        println(json)
    }
}