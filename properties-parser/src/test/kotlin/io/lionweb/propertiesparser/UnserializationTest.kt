package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.model.Node
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.testing.assertASTsAreEqual
import io.lionweb.Properties.*
import io.lionweb.lioncore.java.serialization.JsonSerialization
import junit.framework.TestCase.assertEquals
import org.junit.Ignore
import org.junit.Test

class UnserializationTest {

    @Test
    @Ignore("Get github action running")
    fun unserializeSimpleExample() {
        val ast = PropertiesFile(
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        ast.assignParents()
        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.instantiator.enableDynamicNodes()
        jsonser.registerLanguage(PropertiesLWLanguage)

        val json = jsonser.serializeTreeToJsonString(ast.toLionWeb())
        val unserializedAST = jsonser.deserializeToNodes(json)
        assertEquals(7, unserializedAST.size)

        val starlasuAST = unserializedAST[0].toStarLasu()

        assertASTsAreEqual(ast, starlasuAST)
    }

    @Test
    fun issue12() {
        val jsonser = JsonSerialization.getStandardSerialization()
        jsonser.instantiator.enableDynamicNodes()
        jsonser.registerLanguage(PropertiesLWLanguage)
        val unserializedAST = jsonser.deserializeToNodes(this.javaClass.getResourceAsStream("/issue12.json"))
        assertEquals(7, unserializedAST.size)
        val starlasuAST = unserializedAST[0].toStarLasu()
        assertASTsAreEqual(
            PropertiesFile(
                "MyFile",
                mutableListOf(
                    Property("a", (IntValue(1))),
                    Property("b", (BooleanValue(true))),
                    Property("c", (StringValue("foo")))
                )
            ),
            starlasuAST
        )
    }
}
