package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.ASTNode

data class PropertiesFile(val props: MutableList<Property> = mutableListOf()) : ASTNode() {
    constructor(vararg props: Property) : this(props.toMutableList())
}

data class Property(var name: String, var value: Value) : ASTNode()

sealed class Value : ASTNode()

data class IntValue(var value: String) : Value() {
    constructor(value: Int) : this(value.toString())
}
data class DecValue(var value: String) : Value() {
    constructor(value: Double) : this(value.toString())
}
data class StringValue(var value: String) : Value()

data class BooleanValue(var value: Boolean) : Value()
