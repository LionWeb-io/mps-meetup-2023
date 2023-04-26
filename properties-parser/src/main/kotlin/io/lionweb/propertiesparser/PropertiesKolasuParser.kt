package io.lionweb.propertiesparser

import com.strumenta.kolasu.parsing.KolasuParser
import com.strumenta.kolasu.parsing.KolasuToken
import com.strumenta.kolasu.validation.Issue
import io.lionweb.propertiesparser.PropertiesParser.PropertiesFileContext
import org.antlr.v4.runtime.CharStream
import org.antlr.v4.runtime.Lexer
import org.antlr.v4.runtime.Token
import org.antlr.v4.runtime.TokenStream

class PropertiesKolasuParser : KolasuParser<PropertiesFile, PropertiesParser, PropertiesFileContext, KolasuToken>() {
    override fun createANTLRLexer(charStream: CharStream): Lexer {
        TODO("Not yet implemented")
    }

    override fun createANTLRParser(tokenStream: TokenStream): PropertiesParser {
        TODO("Not yet implemented")
    }

    override fun parseTreeToAst(
        parseTreeRoot: PropertiesFileContext,
        considerPosition: Boolean,
        issues: MutableList<Issue>
    ): PropertiesFile? {
        TODO("Not yet implemented")
    }

    override fun tokenInstantiator(t: Token): KolasuToken {
        TODO("Not yet implemented")
    }
}