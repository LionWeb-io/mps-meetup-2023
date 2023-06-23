package io.lionweb.propertiesparser

import com.strumenta.kolasu.lionweb.KolasuLanguage
import com.strumenta.kolasu.lionweb.LionWebLanguageExporter
import io.lionweb.lioncore.java.language.Language

val PropertiesKLanguage: KolasuLanguage = KolasuLanguage("io.lionweb.Properties").apply {
    addClass(PropertiesFile::class)
}

val PropertiesLWLanguage: Language by lazy {
    val exporter = LionWebLanguageExporter()
    exporter.correspondingLanguage(PropertiesKLanguage)
}
