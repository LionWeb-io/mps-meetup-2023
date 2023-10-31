package io.lionweb.propertiesparser

import com.strumenta.kolasu.language.KolasuLanguage
import com.strumenta.kolasu.lionweb.LionWebLanguageConverter
import com.strumenta.kolasu.lionweb.LionWebModelConverter
import com.strumenta.kolasu.model.Node
import io.lionweb.lioncore.java.language.Language

val PropertiesKLanguage: KolasuLanguage = KolasuLanguage("io.lionweb.Properties").apply {
    addClass(PropertiesFile::class)
}

val PropertiesLWLanguage: Language by lazy {
    val exporter = LionWebLanguageConverter()
    exporter.exportToLionWeb(PropertiesKLanguage)
}

val exporter by lazy {
    val exporter = LionWebModelConverter()
    exporter.exportLanguageToLionWeb(PropertiesKLanguage)
    exporter
}

fun Node.toLionWeb(): io.lionweb.lioncore.java.model.Node {
    return exporter.exportModelToLionWeb(this)
}

fun io.lionweb.lioncore.java.model.Node.toStarLasu(): Node {
    return exporter.importModelFromLionWeb(this)
}
