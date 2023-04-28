package io.lionweb.propertiesparser

import com.strumenta.kolasu.testing.assertASTsAreEqual
import com.strumenta.kolasu.validation.Issue
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.junit.Test
import org.lionweb.lioncore.java.utils.NodeTreeValidator
import java.io.File
import kotlin.test.assertEquals

class KolasuPropertiesParserTest {

    @Test
    fun parseSimpleCase() {
        val code = """a = 1
            |b = true
            |c = "foo"
        """.trimMargin()
        val parser = PropertiesKolasuParser()
        val result = parser.parse(code)
        assert(result.issues.isEmpty())
        assertASTsAreEqual(
            PropertiesFile(
                Property("a", IntValue(1)),
                Property("b", BooleanValue(true)),
                Property("c", StringValue("foo"))
            ),
            result
        )
    }

    @Test
    fun checkValidityOfASTs() {
        val code = """a = 1
            |b = true
            |c = "foo"
        """.trimMargin()
        val parser = PropertiesKolasuParser()
        val result = parser.parse(code)
        assert(result.issues.isEmpty())
        val vr = NodeTreeValidator().validate(result.root)
        assert(vr.isSuccessful)
    }

    @Test
    fun checkValidityOfASTsWhenParsingRealFile() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        assert(result.issues.isEmpty())
        val vr = NodeTreeValidator().validate(result.root)
        assert(vr.isSuccessful)
    }

    @Test
    fun checkRootHasProperNodeID() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        assertEquals("file_examples-example1-props-", result.root!!.id)
    }
}
