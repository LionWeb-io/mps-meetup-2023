package io.lionweb.propertiesparser

import com.strumenta.kolasu.testing.assertASTsAreEqual
import io.lionweb.Properties.*
import io.lionweb.lioncore.java.utils.NodeTreeValidator
import org.junit.Ignore
import org.junit.Test
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
                mutableListOf(
                    Property("a", (IntValue("1"))),
                    Property("b", (BooleanValue(true))),
                    Property("c", (StringValue("foo")))
                )
            ),
            result
        )
    }

    @Test
    @Ignore("Get github action running")
    fun checkValidityOfASTs() {
        val code = """a = 1
            |b = true
            |c = "foo"
        """.trimMargin()
        val parser = PropertiesKolasuParser()
        val result = parser.parse(code)
        assert(result.issues.isEmpty())

        val vr = NodeTreeValidator().validate(result.root!!.toLionWeb())
        assert(vr.isSuccessful)
    }

    @Test
    @Ignore("Get github action running")
    fun checkValidityOfASTsWhenParsingRealFile() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        assert(result.issues.isEmpty())
        val vr = NodeTreeValidator().validate(result.root!!.toLionWeb())
        assert(vr.isSuccessful) {
            vr.issues.joinToString("\n") { it.toString() }
        }
    }

    @Test
    @Ignore("Get github action running")
    fun checkRootHasProperNodeID() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        val exported = result.root!!.toLionWeb()
        assertEquals("file_examples-example1-props_root", exported.id)
    }
}
