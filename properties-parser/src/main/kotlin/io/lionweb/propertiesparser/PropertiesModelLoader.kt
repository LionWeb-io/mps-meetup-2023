package io.lionweb.propertiesparser

import io.lionweb.lioncore.java.language.LionCoreBuiltins
import io.lionweb.lioncore.java.self.LionCore
import io.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.File
import java.io.FileInputStream

class PropertiesModelLoader {
    fun loadModel(file: File): PropertiesFile {
        val jsonSer = JsonSerialization.getStandardSerialization()
        jsonSer.registerLanguage(PropertiesLWLanguage)
        return jsonSer.deserializeToNodes(FileInputStream(file))[0] as PropertiesFile
    }
}
