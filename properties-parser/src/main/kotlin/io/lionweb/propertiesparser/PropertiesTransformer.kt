package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.replaceWith
import com.strumenta.kolasu.traversing.walkDescendants
import io.lionweb.Properties.*
import kotlin.reflect.jvm.internal.impl.resolve.constants.DoubleValue

fun capitalize(model: PropertiesFile) {
    model.walkDescendants(Property::class).forEach {
        it.name = it.name.uppercase()
    }
    model.walkDescendants(StringValue::class).forEach {
        it.value = it.value.uppercase()
    }
}

fun double(model: PropertiesFile) {
    model.walkDescendants(IntValue::class).forEach {
        it.value = (it.value.toInt() * 2).toString()
    }
    model.walkDescendants(DecValue::class).forEach {
        it.value = (it.value.toDouble() * 2).toString()
    }
}

fun negate(model: PropertiesFile) {
    model.walkDescendants(BooleanValue::class).forEach {
        it.value = !it.value
    }
}

fun reverse(model: PropertiesFile) {
    model.props.reversed()
}

fun convertToString(model: PropertiesFile) {
    model.walkDescendants(IntValue::class).forEach {
        it.replaceWith(StringValue(it.value))
    }
    model.walkDescendants(DecValue::class).forEach {
        it.replaceWith(StringValue(it.value))
    }
    model.walkDescendants(BooleanValue::class).forEach {
        it.replaceWith(StringValue(it.value.toString()))
    }
}
