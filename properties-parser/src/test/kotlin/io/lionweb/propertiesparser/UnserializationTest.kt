package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.model.ASTNode
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.model.lionweb.concept
import com.strumenta.kolasu.testing.assertASTsAreEqual
import junit.framework.TestCase.assertEquals
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

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
        Metamodel.prepareSerialization(jsonser)
        val json = jsonser.serializeTreeToJsonString(ast)
        val unserializedAST = jsonser.unserializeToNode(json)
        assertEquals(7, unserializedAST.size)
        assertASTsAreEqual(ast, unserializedAST[0] as ASTNode)
    }
}
