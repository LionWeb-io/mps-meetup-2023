package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.lionweb.LionWebModelImporterAndExporter
import com.strumenta.kolasu.model.Node
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.testing.assertASTsAreEqual
import io.lionweb.lioncore.java.serialization.JsonSerialization
import junit.framework.TestCase.assertEquals
import org.junit.Test

class UnserializationTest {

    @Test
    fun unserializeSimpleExample() {
        val ast = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        ast.assignParents()
        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.registerLanguage(PropertiesLWLanguage)

        val json = jsonser.serializeTreeToJsonString(ast.toLionWeb())
        val unserializedAST = jsonser.unserializeToNodes(json)
        assertEquals(7, unserializedAST.size)
        assertASTsAreEqual(ast, unserializedAST[0] as Node)
    }

    @Test
    fun issue12() {
        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.registerLanguage(PropertiesLWLanguage)
        val unserializedAST = jsonser.unserializeToNodes(this.javaClass.getResourceAsStream("/issue12.json"))
        assertEquals(7, unserializedAST.size)
        assertASTsAreEqual(
            PropertiesFile(
                Property("a", IntValue(1)),
                Property("b", BooleanValue(true)),
                Property("c", StringValue("foo"))
            ),
            unserializedAST.first() as Node
        )
    }
}
