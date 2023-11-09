package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.FileSource
import com.strumenta.kolasu.model.SimpleOrigin
import com.strumenta.kolasu.model.Source
import com.strumenta.kolasu.parsing.ANTLRTokenFactory
import com.strumenta.kolasu.parsing.KolasuANTLRToken
import com.strumenta.kolasu.parsing.KolasuParser
import com.strumenta.kolasu.parsing.ParsingResult
import com.strumenta.kolasu.traversing.walk
import com.strumenta.kolasu.validation.Issue
import io.lionweb.Properties.*
import io.lionweb.propertiesparser.PropertiesParser.PropertiesFileContext
import org.antlr.v4.runtime.CharStream
import org.antlr.v4.runtime.Lexer
import org.antlr.v4.runtime.TokenStream
import java.io.File
import java.nio.charset.Charset

class PropertiesKolasuParser : KolasuParser<PropertiesFile, PropertiesParser, PropertiesFileContext, KolasuANTLRToken>(
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
        issues: MutableList<Issue>,
        source: Source?
    ): PropertiesFile? {
        val transformer = PropertiesParseTreeTransformer()
        val ast = transformer.transform(parseTreeRoot) as? PropertiesFile
        issues.addAll(transformer.issues)
        return ast
    }

    override fun parse(
        file: File,
        charset: Charset,
        considerRange: Boolean,
        measureLexingTime: Boolean
    ): ParsingResult<PropertiesFile> {
        val pr = super.parse(file, charset, considerRange, measureLexingTime)
        pr.root!!.walk().forEach {
            it.detach()
            (it.origin as SimpleOrigin).position!!.source = FileSource(file)
        }
        return pr
    }
}
