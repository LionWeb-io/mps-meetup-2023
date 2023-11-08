package generator.lionweb.reflective;

import io.lionweb.lioncore.java.serialization.JsonSerialization
import io.lionweb.emf.support.PropertiesLanguage

class LionWebReflective {
	def static void main(String[] args) {
	    new LionWebReflective().generate()
	}

	def generate() {
		val JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization()
		jsonSerialization.enableDynamicNodes

		val lang = PropertiesLanguage.getInstance()

		jsonSerialization.registerLanguage(lang.PROPERTIES_MM)
		val nodes = jsonSerialization.deserializeToNodes(this.getClass().getResourceAsStream("/example1-exported.lm.json"))

		val propertyFile = nodes.filter[it.concept == lang.PROPERTIESFILE].head

		println('''
		Library «propertyFile.getChildrenByContainmentName("props")»

		''')
	}
}