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
        return PropertiesLexer(charStream)
    }

    override fun createANTLRParser(tokenStream: TokenStream): PropertiesParser {
        return PropertiesParser(tokenStream)
    }

    override fun parseTreeToAst(
        parseTreeRoot: PropertiesFileContext,
        considerPosition: Boolean,
        issues: MutableList<Issue>
    ): PropertiesFile? {
        val transformer = PropertiesParseTreeTransformer()
        val ast = transformer.transform(parseTreeRoot) as? PropertiesFile
        issues.addAll(transformer.issues)
        return ast
    }

    override fun tokenInstantiator(t: Token): KolasuToken {
        TODO("Not yet implemented")
    }
}
