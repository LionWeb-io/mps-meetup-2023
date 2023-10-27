package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.KolasuLanguage
import com.strumenta.kolasu.lionweb.LionWebLanguageExporter
import com.strumenta.kolasu.lionweb.LionWebModelImporterAndExporter
import com.strumenta.kolasu.model.Node
import io.lionweb.lioncore.java.language.Language

val PropertiesKLanguage: KolasuLanguage = KolasuLanguage("io.lionweb.Properties").apply {
    addClass(PropertiesFile::class)
}

val PropertiesLWLanguage: Language by lazy {
    val exporter = LionWebLanguageExporter()
    exporter.export(PropertiesKLanguage)
}

val exporter by lazy {
    val exporter = LionWebModelImporterAndExporter()
    exporter.recordLanguage(PropertiesKLanguage)
    exporter
}

fun Node.toLionWeb(): io.lionweb.lioncore.java.model.Node {
    return exporter.export(this)
}

fun io.lionweb.lioncore.java.model.Node.toStarLasu(): Node {
    return exporter.import(this)
}
