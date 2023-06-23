package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.StarLasuLWLanguage
import io.lionweb.lioncore.java.serialization.JsonSerialization
import junit.framework.TestCase.assertEquals
import org.junit.Test

class MetamodelTest {

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
