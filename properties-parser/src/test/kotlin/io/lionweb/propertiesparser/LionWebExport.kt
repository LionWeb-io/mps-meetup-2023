package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

class LionWebExport {

    @Test
    fun exportMetamodel() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val jsonel = jsonser.serializeTreeToJson(Metamodel)
        val gson = GsonBuilder().serializeNulls().setPrettyPrinting().create()
        val json = gson.toJson(jsonel)
        println(json)
    }

    @Test
    fun exportModel() {
        val ast = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        val jsonser = JsonSerialization.getStandardSerialization()
        Metamodel.prepareSerialization(jsonser)
        val jsonel = jsonser.serializeTreeToJson(ast)
        val gson = GsonBuilder().serializeNulls().setPrettyPrinting().create()
        val json = gson.toJson(jsonel)
        println(json)
    }
}