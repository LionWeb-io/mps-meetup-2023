package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.LionWebModelImporterAndExporter
import com.strumenta.kolasu.testing.assertASTsAreEqual
import com.strumenta.kolasu.validation.Issue
import io.lionweb.lioncore.java.utils.NodeTreeValidator
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
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

        val exporter = LionWebModelImporterAndExporter()

        val vr = NodeTreeValidator().validate(exporter.export(result.root!!))
        assert(vr.isSuccessful)
    }

    @Test
    fun checkValidityOfASTsWhenParsingRealFile() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        assert(result.issues.isEmpty())
        val exporter = LionWebModelImporterAndExporter()
        val vr = NodeTreeValidator().validate(exporter.export(result.root!!))
        assert(vr.isSuccessful)
    }

    @Test
    fun checkRootHasProperNodeID() {
        val parser = PropertiesKolasuParser()
        val result = parser.parse(File("examples/example1.props"))
        val exporter = LionWebModelImporterAndExporter()
        val exported = exporter.export(result.root!!)
        assertEquals("file_examples-example1-props-", exported.id)
    }
}
