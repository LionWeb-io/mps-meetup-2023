package io.lionweb.propertiesparser

import com.strumenta.kolasu.metamodel.StarLasuMetamodel
import org.lionweb.lioncore.java.metamodel.LionCoreBuiltins
import org.lionweb.lioncore.java.self.LionCore
import org.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.File
import java.io.FileInputStream

class PropertiesModelLoader {
    fun loadModel(file: File): PropertiesFile {
        val jsonSer = JsonSerialization.getStandardSerialization()
        Metamodel.prepareSerialization(jsonSer)
        return jsonSer.unserializeToNodes(FileInputStream(file))[0] as PropertiesFile
    }
}
