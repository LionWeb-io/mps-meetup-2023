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
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        model.assignParents()
        capitalize(model)
        assertASTsAreEqual(
            PropertiesFile(
                "",
                mutableListOf(
                    Property("A", (IntValue(1))),
                    Property("B", (BooleanValue(true))),
                    Property("C", (StringValue("FOO")))
                )
            ),
            model
        )
    }

    @Test
    fun testDouble() {
        val model = PropertiesFile(
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        model.assignParents()
        double(model)
        assertASTsAreEqual(
            PropertiesFile(
                "",
                mutableListOf(
                    Property("a", (IntValue(2))),
                    Property("b", (BooleanValue(true))),
                    Property("c", (StringValue("foo")))
                )
            ),
            model
        )
    }

    @Test
    fun testNegate() {
        val model = PropertiesFile(
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        model.assignParents()
        negate(model)
        assertASTsAreEqual(
            PropertiesFile(
                "",
                mutableListOf(
                    Property("a", (IntValue(1))),
                    Property("b", (BooleanValue(false))),
                    Property("c", (StringValue("foo")))
                )
            ),
            model
        )
    }

    @Test
    @Ignore("Get github action running")
    fun testReverse() {
        val model = PropertiesFile(
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        model.assignParents()
        reverse(model)
        assertASTsAreEqual(
            PropertiesFile(
                "",
                mutableListOf(
                    Property("c", (StringValue("foo"))),
                    Property("b", (BooleanValue(true))),
                    Property("a", (IntValue(1)))
                )
            ),
            model
        )
    }

    @Test
    fun testConvertToString() {
        val model = PropertiesFile(
            "",
            mutableListOf(
                Property("a", (IntValue(1))),
                Property("b", (BooleanValue(true))),
                Property("c", (StringValue("foo")))
            )
        )
        model.assignParents()
        convertToString(model)
        assertASTsAreEqual(
            PropertiesFile(
                "",
                mutableListOf(
                    Property("a", (StringValue("1"))),
                    Property("b", (StringValue("true"))),
                    Property("c", (StringValue("foo")))
                )
            ),
            model
        )
    }
}
