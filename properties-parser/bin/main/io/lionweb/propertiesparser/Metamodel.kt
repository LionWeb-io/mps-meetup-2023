package io.lionweb.propertiesparser

import com.strumenta.kolasu.model.lionweb.ReflectionBasedMetamodel

object Metamodel : ReflectionBasedMetamodel("io_lionweb_Properties", "io.lionweb.Properties", PropertiesFile::class)
