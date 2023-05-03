package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.metamodel.StarLasuMetamodel
import junit.framework.TestCase.assertEquals
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization
import java.util.Collections

class MetamodelTest {

    @Test
    fun conceptFeaturesAreNotNull() {
        val propertiesFile = Metamodel.getConceptByName("PropertiesFile")!!
        assertEquals(false, propertiesFile.isAbstract)
    }

    @Test
    fun propertiesMetamodelDependsOnStarLasu() {
        assertEquals(listOf(StarLasuMetamodel), Metamodel.dependsOn())
    }

    @Test
    fun loadingPropertyMetamodel() {
        val propertiesMetamodelSerialization = JsonSerialization.getStandardSerialization()
            .serializeTreeToJsonElement(Metamodel)
        val starlasuMetamodelSerialization = JsonSerialization.getStandardSerialization()
            .serializeTreeToJsonElement(StarLasuMetamodel)

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
                StarLasuMetamodel.thisAndAllDescendants() +
                    Metamodel.thisAndAllDescendants()
            )
        val unserialized = JsonSerialization.getStandardSerialization().unserializeToNodes(combinedJson)
        val metamodels = unserialized.filterIsInstance<org.lionweb.lioncore.java.metamodel.Metamodel>()
        assertEquals(2, metamodels.size)
        assertEquals(setOf("com.strumenta.StarLasu", "io.lionweb.Properties"), metamodels.map { it.name }.toSet())
    }
}
