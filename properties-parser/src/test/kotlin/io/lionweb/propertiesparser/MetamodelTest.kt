package io.lionweb.propertiesparser

import com.google.gson.GsonBuilder
import junit.framework.TestCase.assertEquals
import org.junit.Test
import org.lionweb.lioncore.java.serialization.JsonSerialization

class MetamodelTest {

    @Test
    fun conceptFeaturesAreNotNull() {
        val propertiesFile = Metamodel.getConceptByName("PropertiesFile")!!
        assertEquals(false, propertiesFile.isAbstract)
    }
}
