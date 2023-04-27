package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.model.ASTNode
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.model.lionweb.concept
import com.strumenta.kolasu.testing.assertASTsAreEqual
import junit.framework.TestCase.assertEquals
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

class CodeGeneratorTest {

    @Test
    fun unserializeAndPrintSimpleExample() {
        val ast = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        assertEquals(
            """a = 1
b = true
c = "foo"
""",
            PropertiesCodeGenerator().printToString(ast)
        )
    }
}
