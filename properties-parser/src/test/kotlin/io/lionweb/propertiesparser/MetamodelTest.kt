package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.StarLasuLWLanguage
import io.lionweb.lioncore.java.serialization.JsonSerialization
import io.lionweb.lioncore.java.utils.LanguageValidator
import io.lionweb.lioncore.java.utils.NodeTreeValidator
import io.lionweb.lioncore.java.utils.ValidationResult
import junit.framework.TestCase.assertEquals
import org.junit.Test

class MetamodelTest {

    @Test
    fun verifyExportedMetamodel() {
        val res = LanguageValidator().validateLanguage(PropertiesLWLanguage)
        assert(res.isSuccessful) { res.issues.joinToString("\n") }
    }

    @Test
    fun canUnserializeSerializedLanguage() {
        val jsonser = JsonSerialization.getStandardSerialization()
        val serialized = jsonser.serializeTreesToJsonString(PropertiesLWLanguage)
        jsonser.nodeResolver.addTree(StarLasuLWLanguage)
        val unserialized = jsonser.unserializeToNodes(serialized).first()
    }

    @Test
    fun conceptFeaturesAreNotNull() {
        val propertiesFile = PropertiesLWLanguage.getConceptByName("PropertiesFile")!!
        assertEquals(false, propertiesFile.isAbstract)
    }

    @Test
    fun propertiesMetamodelDependsOnStarLasu() {
        assertEquals(listOf(StarLasuLWLanguage), PropertiesLWLanguage.dependsOn())
    }

    @Test
    fun loadingPropertyMetamodel() {
        val propertiesMetamodelSerialization = JsonSerialization.getStandardSerialization()
            .serializeTreeToJsonElement(PropertiesLWLanguage)
        val starlasuMetamodelSerialization = JsonSerialization.getStandardSerialization()
            .serializeTreeToJsonElement(StarLasuLWLanguage)

        val jsonSerialization = JsonSerialization.getStandardSerialization()
        val starlasuUnserialized = jsonSerialization.unserializeToNodes(starlasuMetamodelSerialization).first()
        jsonSerialization.nodeResolver.addTree(starlasuUnserialized)
        val propertiesUnserialized = jsonSerialization.unserializeToNodes(propertiesMetamodelSerialization).first()
        // We test we can load without crashing, as comparison of Metamodels with equality is not yet
        // correctly implemented
    }

    @Test
    fun loadingCombinedMetamodel() {
        val combinedJson =
            JsonSerialization.getStandardSerialization().serializeNodesToJsonString(
                StarLasuLWLanguage.thisAndAllDescendants() +
                    PropertiesLWLanguage.thisAndAllDescendants()
            )
        val unserialized = JsonSerialization.getStandardSerialization().unserializeToNodes(combinedJson)
        val metamodels = unserialized.filterIsInstance<io.lionweb.lioncore.java.language.Language>()
        assertEquals(2, metamodels.size)
        assertEquals(setOf("com.strumenta.StarLasu", "io.lionweb.Properties"), metamodels.map { it.name }.toSet())
    }
}
