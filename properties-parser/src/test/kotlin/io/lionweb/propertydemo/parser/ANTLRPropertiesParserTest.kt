package io.lionweb.propertydemo.parser

import com.strumenta.kolasu.parsing.injectErrorCollectorInLexer
import com.strumenta.kolasu.parsing.injectErrorCollectorInParser
import com.strumenta.kolasu.testing.assertParseTreeStr
import com.strumenta.kolasu.validation.Issue
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.junit.Test

class ANTLRPropertiesParserTest {

    @Test
    fun parseSimpleCase() {
        val code = """a = 1
            |b = true
            |c = "foo"
        """.trimMargin()
        val issues = mutableListOf<Issue>()
        val lexer = PropertiesLexer(CharStreams.fromString(code))
        lexer.injectErrorCollectorInLexer(issues)
        val parser = PropertiesParser(CommonTokenStream(lexer))
        parser.injectErrorCollectorInParser(issues)
        val parseTree = parser.propertiesFile()
        assertParseTreeStr(
            """PropertiesFile
  Property
    T:ID[a]
    T:EQUAL[=]
    Value
      T:INT_NUMBER[1]
    T:NEWLINE[
]
  Property
    T:ID[b]
    T:EQUAL[=]
    Value
      T:TRUE[true]
    T:NEWLINE[
]
  Property
    T:ID[c]
    T:EQUAL[=]
    Value
      T:STRING["foo"]
    T:EOF[<EOF>]
  T:EOF[<EOF>]""",
            parseTree, PropertiesParser.VOCABULARY
        )
        assert(issues.isEmpty())
    }
}
