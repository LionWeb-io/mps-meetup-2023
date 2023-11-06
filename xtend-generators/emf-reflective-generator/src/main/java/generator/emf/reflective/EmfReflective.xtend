package generator.emf.reflective;

import io.lionweb.lioncore.java.emf.EMFModelExporter
import io.lionweb.lioncore.java.model.Node
import io.lionweb.lioncore.java.serialization.JsonSerialization
import io.lionweb.lioncore.java.language.LionCoreBuiltins
import io.lionweb.lioncore.java.emf.mapping.ConceptsToEClassesMapping
import java.io.File
import java.util.List
import java.util.stream.Collectors
import io.lionweb.emf.support.PropertiesLanguage
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMLResourceFactoryImpl
import org.eclipse.emf.ecore.EcorePackage
import org.eclipse.emf.ecore.EcoreFactory

class EmfReflective {
	def static void main(String[] args) {
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("library", new XMIResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xml", new XMLResourceFactoryImpl());
		var ResourceSet rs = new ResourceSetImpl();
		rs.getResourceFactoryRegistry().getExtensionToFactoryMap().put("xml", new XMLResourceFactoryImpl());
		
		var JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization();
	    jsonSerialization.registerLanguage(PropertiesLanguage.PROPERTIES_MM);
	    jsonSerialization.getInstantiator().enableDynamicNodes();
	    val nodes = jsonSerialization.deserializeToNodes(new File(".\\..\\..\\properties-parser\\example1-exported.lm.json"));
	    var List<Node> roots = nodes.stream().filter[it.parent === null].collect(Collectors.toList());

	    var ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();
	    	
	   	conceptMapper.registerMapping(LionCoreBuiltins.getNode(), EcorePackage.eINSTANCE.getEObject())
	   	
	   	val builtinsEPackage = EcoreFactory.eINSTANCE.createEPackage()
	   	builtinsEPackage.name = "LionCore_builtins"
	   	builtinsEPackage.nsURI = "LionCore-builtins"
	   	
	   	val eCoreINamed = EcoreFactory.eINSTANCE.createEClass()
	   	eCoreINamed.name = "INamed"
	   	eCoreINamed.interface = true
	   	builtinsEPackage.EClassifiers.add(eCoreINamed)
	   	
	   	val eCoreINamedName = EcoreFactory.eINSTANCE.createEAttribute()
	   	eCoreINamedName.name = "name"
	   	eCoreINamedName.EType = EcorePackage.eINSTANCE.EString
	   	eCoreINamed.EStructuralFeatures.add(eCoreINamedName)
	   	
	   	conceptMapper.registerMapping(LionCoreBuiltins.getINamed(), eCoreINamed)
	    
	    var EMFModelExporter emfExporter = new EMFModelExporter(conceptMapper);
	    var Resource resource = emfExporter.exportResource(roots);
	       
	    val propertiesFile = resource.contents.head
	    val libraryNameAttribute = propertiesFile.eClass.EAllAttributes.findFirst[it.name == "name"]
	    val bookClass = propertiesFile.eClass.EPackage.EClassifiers.findFirst[it.name == "Book"] as EClass
	    val writerClass = propertiesFile.eClass.EPackage.EClassifiers.findFirst[it.name == "Writer"] as EClass
	    val guideBookWriterClass = propertiesFile.eClass.EPackage.EClassifiers.findFirst[it.name == "GuideBookWriter"] as EClass
	    val bookTitleAttribute = bookClass.EAllAttributes.findFirst[it.name == "title"]
	    val writerNameAttribute = writerClass.EAllAttributes.findFirst[it.name == "name"]
	    val gbwCountriesAttribute = guideBookWriterClass.EAllAttributes.findFirst[it.name == "countries"]
	    
	    println('''
			«FOR c: propertiesFile.eContents»
				«IF c.eClass.name == "Book"»
					Book: «c.eGet(bookTitleAttribute)»
				«ELSEIF c.eClass.name == "Writer"»
					writer: «c.eGet(writerNameAttribute)»
				«ELSEIF c.eClass.name == "GuideBookWriter"»
					guide book writer: «c.eGet(writerNameAttribute)»
					guides for: «c.eGet(gbwCountriesAttribute)»
				«ENDIF»
			«ENDFOR»
	    ''')
	}
}