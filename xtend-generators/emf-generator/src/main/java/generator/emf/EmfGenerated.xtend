package generator.emf;

import io.lionweb.lioncore.java.emf.EMFModelExporter
import io.lionweb.lioncore.java.emf.mapping.ConceptsToEClassesMapping
import io.lionweb.lioncore.java.language.Concept
import io.lionweb.lioncore.java.language.Interface
import io.lionweb.lioncore.java.model.Node
import io.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.File
import java.util.List
import java.util.stream.Collectors
import nl.f1re.emf.library.model.library.GuideBookWriter
import nl.f1re.emf.library.model.library.Library
import nl.f1re.emf.library.model.library.LibraryPackage
import nl.f1re.emf.library.model.library.SpecialistBookWriter
import nl.f1re.emf.library.model.library.Writer
import nl.f1re.emf.support.LibraryLanguage
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMLResourceFactoryImpl

class EmfGenerated {
	def static void main(String[] args) {
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("library", new XMIResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xml", new XMLResourceFactoryImpl());
		LibraryPackage.eINSTANCE.nsURI
		var ResourceSet rs = new ResourceSetImpl();
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("xml", new XMLResourceFactoryImpl());
		
		var JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization();
	    jsonSerialization.registerLanguage(LibraryLanguage.LIBRARY_MM);
	    jsonSerialization.getInstantiator().enableDynamicNodes();
	    val nodes = jsonSerialization.unserializeToNodes(new File(".\\..\\bobslibrary.json"));
	    var List<Node> roots = nodes.stream().filter[it.parent === null].collect(Collectors.toList());
	    
	    var ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();
	    for (element : LibraryLanguage.LIBRARY_MM.elements) {
	    	switch (element) {
	    		Concept : {
	    			var eClass = LibraryPackage.eINSTANCE.EClassifiers.filter(EClass).findFirst[it.name == element.name]
	    			if(eClass !== null) {
	    				conceptMapper.registerMapping(element, eClass)
	    			}
	    		}
	    		// Change to Interface
	    		Interface : {
	    			var eClass = LibraryPackage.eINSTANCE.EClassifiers.filter(EClass).findFirst[it.name == element.name]
	    			if(eClass !== null) {
	    				conceptMapper.registerMapping(element, eClass)
	    			}
	    		}
	    	}
	    }

	    var EMFModelExporter emfExporter = new EMFModelExporter(conceptMapper);
	    var Resource resource = emfExporter.exportResource(roots);
	    
	    val lib = resource.contents.filter(Library).head
		val writers = lib.writers
	    
	    println('''
			Library «lib.name»
			
				«FOR book: lib.books»
					Book: «book.title»
				«ENDFOR»
				«FOR w: writers»
					«writer(w)»
				«ENDFOR»
	    ''')
	}
	
	def static dispatch writer(Writer w) '''
		writer: «w.name»
	'''
	
	def static dispatch writer(GuideBookWriter w) '''
		guide book writer: «w.name»
		guides for «w.countries»
	'''
	
	def static dispatch writer(SpecialistBookWriter w) '''
		specialist writer: «w.name»
		writes for «w.subject»
	'''
}