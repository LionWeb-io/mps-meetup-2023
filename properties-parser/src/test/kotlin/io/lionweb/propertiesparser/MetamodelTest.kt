package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import com.strumenta.kolasu.metamodel.StarLasuMetamodel
import junit.framework.TestCase.assertEquals
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

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
        val starlasuUnserialized = jsonSerialization.unserializeToNode(starlasuMetamodelSerialization).first()
        jsonSerialization.nodeResolver.addTree(starlasuUnserialized)
        val propertiesUnserialized = jsonSerialization.unserializeToNode(propertiesMetamodelSerialization).first()
        // We test we can load without crashing, as comparison of Metamodels with equality is not yet
        // correctly implemented
    }
}
