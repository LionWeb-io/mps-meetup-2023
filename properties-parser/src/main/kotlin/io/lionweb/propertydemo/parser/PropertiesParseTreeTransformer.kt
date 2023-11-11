package io.lionweb.propertydemo.parser

import com.strumenta.kolasu.mapping.ParseTreeToASTTransformer
import io.lionweb.Properties.*
import io.lionweb.propertydemo.parser.PropertiesParser.PropertiesFileContext
import io.lionweb.propertydemo.parser.PropertiesParser.PropertyContext
import io.lionweb.propertydemo.parser.PropertiesParser.ValueContext

class PropertiesParseTreeTransformer : ParseTreeToASTTransformer(allowGenericNode = false) {

    init {
        registerNodeFactory(PropertiesFileContext::class) { pt: PropertiesFileContext ->
            PropertiesFile("", pt.property().map { transform(it) as Property }.toMutableList())
        }
        registerNodeFactory(PropertyContext::class) { pt: PropertyContext ->
            Property(pt.ID().text, transform(pt.value()) as Value)
        }
        registerNodeFactory(ValueContext::class) { pt: ValueContext ->
            when {
                pt.INT_NUMBER() != null -> IntValue(Integer.parseInt(pt.INT_NUMBER().text))
                pt.DEC_NUMBER() != null -> DecValue(pt.INT_NUMBER().text)
                pt.STRING() != null -> StringValue(pt.STRING().text.removeSurrounding("\""))
                pt.TRUE() != null -> BooleanValue(true)
                pt.FALSE() != null -> BooleanValue(false)
                else -> TODO(pt.text)
            }
        }
    }
}
