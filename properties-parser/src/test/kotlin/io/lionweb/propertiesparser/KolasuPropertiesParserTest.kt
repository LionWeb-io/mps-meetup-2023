package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.debugPrint
import com.strumenta.kolasu.parsing.injectErrorCollectorInLexer
import com.strumenta.kolasu.parsing.injectErrorCollectorInParser
import com.strumenta.kolasu.testing.assertASTsAreEqual
import com.strumenta.kolasu.testing.assertParseTreeStr
import com.strumenta.kolasu.validation.Issue
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.junit.Test

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
        assertASTsAreEqual(PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        ), result)
    }
}