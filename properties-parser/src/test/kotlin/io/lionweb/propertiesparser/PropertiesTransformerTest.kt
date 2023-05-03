package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.testing.assertASTsAreEqual
import kotlin.test.Test

class PropertiesTransformerTest {
    @Test
    fun testCapitalize() {
        val model = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        model.assignParents()
        capitalize(model)
        assertASTsAreEqual(
            PropertiesFile(
                Property("A", IntValue(1)),
                Property("B", BooleanValue(true)),
                Property("C", StringValue("FOO"))
            ),
            model
        )
    }

    @Test
    fun testDouble() {
        val model = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        model.assignParents()
        double(model)
        assertASTsAreEqual(
            PropertiesFile(
                Property("a", IntValue(2)),
                Property("b", BooleanValue(true)),
                Property("c", StringValue("foo"))
            ),
            model
        )
    }

    @Test
    fun testNegate() {
        val model = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        model.assignParents()
        negate(model)
        assertASTsAreEqual(
            PropertiesFile(
                Property("a", IntValue(1)),
                Property("b", BooleanValue(false)),
                Property("c", StringValue("foo"))
            ),
            model
        )
    }

    @Test
    fun testReverse() {
        val model = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        model.assignParents()
        reverse(model)
        assertASTsAreEqual(
            PropertiesFile(
                Property("c", StringValue("foo")),
                Property("b", BooleanValue(true)),
                Property("a", IntValue(1))
            ),
            model
        )
    }

    @Test
    fun testConvertToString() {
        val model = PropertiesFile(
            Property("a", IntValue(1)),
            Property("b", BooleanValue(true)),
            Property("c", StringValue("foo"))
        )
        model.assignParents()
        convertToString(model)
        assertASTsAreEqual(
            PropertiesFile(
                Property("a", StringValue("1")),
                Property("b", StringValue("true")),
                Property("c", StringValue("foo"))
            ),
            model
        )
    }
}
