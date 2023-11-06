package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.LionWebAssociation
import com.strumenta.kolasu.model.Node
import kotlin.Boolean
import kotlin.String

@LionWebAssociation(key = "io-lionweb-Properties_PropertiesFile")
public data class PropertiesFile(
    public var props: Property
) : Node()

@LionWebAssociation(key = "io-lionweb-Properties_Property")
public data class Property(
    public var name: String,
    public var `value`: Value
) : Node()

@LionWebAssociation(key = "io-lionweb-Properties_Value")
public sealed class Value : Node()

@LionWebAssociation(key = "io-lionweb-Properties_BooleanValue")
public data class BooleanValue(
    public var `value`: Boolean
) : Value()

@LionWebAssociation(key = "io-lionweb-Properties_DecValue")
public data class DecValue(
    public var `value`: String
) : Value()

@LionWebAssociation(key = "io-lionweb-Properties_IntValue")
public data class IntValue(
    public var `value`: String
) : Value()

@LionWebAssociation(key = "io-lionweb-Properties_StringValue")
public data class StringValue(
    public var `value`: String
) : Value()
