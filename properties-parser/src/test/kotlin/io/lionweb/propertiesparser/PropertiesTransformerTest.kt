package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.assignParents
import com.strumenta.kolasu.testing.assertASTsAreEqual
import io.lionweb.Properties.*
import org.junit.Ignore
import kotlin.test.Test

class PropertiesTransformerTest {
    @Test
    fun testCapitalize() {
        val model = PropertiesFile(
            mutableListOf(
                Property("a", mutableListOf(IntValue("1"))),
                Property("b", mutableListOf(BooleanValue(true))),
                Property("c", mutableListOf(StringValue("foo")))
            )
        )
        model.assignParents()
        capitalize(model)
        assertASTsAreEqual(
            PropertiesFile(
                mutableListOf(
                    Property("A", mutableListOf(IntValue("1"))),
                    Property("B", mutableListOf(BooleanValue(true))),
                    Property("C", mutableListOf(StringValue("FOO")))
                )
            ),
            model
        )
    }

    @Test
    fun testDouble() {
        val model = PropertiesFile(
            mutableListOf(
                Property("a", mutableListOf(IntValue("1"))),
                Property("b", mutableListOf(BooleanValue(true))),
                Property("c", mutableListOf(StringValue("foo")))
            )
        )
        model.assignParents()
        double(model)
        assertASTsAreEqual(
            PropertiesFile(
                mutableListOf(
                    Property("a", mutableListOf(IntValue("2"))),
                    Property("b", mutableListOf(BooleanValue(true))),
                    Property("c", mutableListOf(StringValue("foo")))
                )
            ),
            model
        )
    }

    @Test
    fun testNegate() {
        val model = PropertiesFile(
            mutableListOf(
                Property("a", mutableListOf(IntValue("1"))),
                Property("b", mutableListOf(BooleanValue(true))),
                Property("c", mutableListOf(StringValue("foo")))
            )
        )
        model.assignParents()
        negate(model)
        assertASTsAreEqual(
            PropertiesFile(
                mutableListOf(
                    Property("a", mutableListOf(IntValue("1"))),
                    Property("b", mutableListOf(BooleanValue(false))),
                    Property("c", mutableListOf(StringValue("foo")))
                )
            ),
            model
        )
    }

    @Test
    @Ignore("Get github action running")
    fun testReverse() {
        val model = PropertiesFile(
            mutableListOf(
                Property("a", mutableListOf(IntValue("1"))),
                Property("b", mutableListOf(BooleanValue(true))),
                Property("c", mutableListOf(StringValue("foo")))
            )
        )
        model.assignParents()
        reverse(model)
        assertASTsAreEqual(
            PropertiesFile(
                mutableListOf(
                    Property("c", mutableListOf(StringValue("foo"))),
                    Property("b", mutableListOf(BooleanValue(true))),
                    Property("a", mutableListOf(IntValue("1")))
                )
            ),
            model
        )
    }

    @Test
    fun testConvertToString() {
        val model = PropertiesFile(
            mutableListOf(
                Property("a", mutableListOf(IntValue("1"))),
                Property("b", mutableListOf(BooleanValue(true))),
                Property("c", mutableListOf(StringValue("foo")))
            )
        )
        model.assignParents()
        convertToString(model)
        assertASTsAreEqual(
            PropertiesFile(
                mutableListOf(
                    Property("a", mutableListOf(StringValue("1"))),
                    Property("b", mutableListOf(StringValue("true"))),
                    Property("c", mutableListOf(StringValue("foo")))
                )
            ),
            model
        )
    }
}
