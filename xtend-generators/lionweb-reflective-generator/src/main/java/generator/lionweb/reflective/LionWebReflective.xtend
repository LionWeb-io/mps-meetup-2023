package generator.lionweb.reflective;

import io.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.File
import nl.f1re.emf.support.LibraryLanguage

class LionWebReflective {
	def static void main(String[] args) {
		val JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization()
		jsonSerialization.enableDynamicNodes
		jsonSerialization.registerLanguage(LibraryLanguage.LIBRARY_MM)
		val nodes = jsonSerialization.unserializeToNodes(new File(".\\..\\bobslibrary.json"))
		
		val library = nodes.filter[it.concept == LibraryLanguage.LIBRARY].head
		
		println('''
		Library «library.getPropertyValueByName("name")»
		
			«FOR c: library.children»
				«IF c.concept == LibraryLanguage.WRITER»
					writer: «c.getPropertyValueByName("name")»
				«ELSEIF c.concept == LibraryLanguage.BOOK»
					«c.getPropertyValueByName("title")»
				«ELSEIF c.concept == LibraryLanguage.GUIDE_BOOK_WRITER»
					guide book writer: «c.getPropertyValueByName("name")»
					guides for: «c.getPropertyValueByName("countries")»
				«ENDIF»
			«ENDFOR»
		''')
	}
}