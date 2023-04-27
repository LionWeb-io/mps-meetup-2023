package io.lionweb.propertiesparser

import com.strumenta.kolasu.antlr.parsing.ANTLRTokenFactory
import com.strumenta.kolasu.antlr.parsing.KolasuANTLRParser
import com.strumenta.kolasu.antlr.parsing.KolasuANTLRToken
import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.parsing.KolasuToken
import com.strumenta.kolasu.validation.Issue
import io.lionweb.propertiesparser.PropertiesParser.PropertiesFileContext
import org.antlr.v4.runtime.CharStream
import org.antlr.v4.runtime.Lexer
import org.antlr.v4.runtime.Token
import org.antlr.v4.runtime.TokenStream

class PropertiesKolasuParser : KolasuANTLRParser<PropertiesFile, PropertiesParser, PropertiesFileContext, KolasuANTLRToken>(
    ANTLRTokenFactory()
) {
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
}
