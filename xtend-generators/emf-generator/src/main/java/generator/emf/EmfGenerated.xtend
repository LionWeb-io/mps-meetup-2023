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
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMLResourceFactoryImpl
import io.lionweb.emf.support.PropertiesLanguage
import io.lionweb.Properties.PropertiesPackage
import io.lionweb.Properties.PropertiesFile
import io.lionweb.Properties.IntValue
import io.lionweb.Properties.DecValue
import io.lionweb.Properties.StringValue
import io.lionweb.Properties.BooleanValue
import org.eclipse.emf.ecore.EcoreFactory
import org.eclipse.emf.ecore.EcorePackage
import io.lionweb.lioncore.java.language.LionCoreBuiltins
import LionCore_builtins.LionCore_builtinsPackage
import java.io.FileWriter
import java.io.BufferedWriter

class EmfGenerated {
	def static void main(String[] args) {
		LionCore_builtinsPackage.eINSTANCE.getNsURI();
		PropertiesPackage.eINSTANCE.getNsURI();
		val ResourceSet rs = new ResourceSetImpl();
		
		val JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization();
	    jsonSerialization.registerLanguage(PropertiesLanguage.PROPERTIES_MM);
	    jsonSerialization.getInstantiator().enableDynamicNodes();
	    val nodes = jsonSerialization.deserializeToNodes(new File(".\\..\\..\\properties-parser\\example1-exported.lm.json"));
	    val List<Node> roots = nodes.stream().filter[it.parent === null].collect(Collectors.toList());
	    
	    val ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();
	    for (element : PropertiesLanguage.PROPERTIES_MM.elements) {
	    	switch (element) {
	    		Concept : {
	    			var eClass = PropertiesPackage.eINSTANCE.EClassifiers.filter(EClass).findFirst[it.name == element.name]
	    			if(eClass !== null) {
	    				conceptMapper.registerMapping(element, eClass)
	    			}
	    			else {
	    				throw new RuntimeException('''Couldn't find EClass for concept «element»''')
	    			}
	    		}
	    		// Change to Interface
	    		Interface : {
	    			var eClass = PropertiesPackage.eINSTANCE.EClassifiers.filter(EClass).findFirst[it.name == element.name]
	    			if(eClass !== null) {
	    				conceptMapper.registerMapping(element, eClass)
	    			}
	    			else {
	    				throw new RuntimeException('''Couldn't find EClass for interface «element»''')
	    			}
	    		}
	    	}
	    }
	    

	    var EMFModelExporter emfExporter = new EMFModelExporter(conceptMapper);
	    var Resource resource = emfExporter.exportResource(roots);
	    
	    val propsFile = resource.contents.filter(PropertiesFile).head
		val properties = propsFile.props
		
		val fileName = "emf-generator-index"
		val htmlFile = new File('''«fileName».html''')
		val bw = new BufferedWriter(new FileWriter(htmlFile))
		
		bw.write('''
			<!DOCTYPE html>
			<head>
				<style>
					div { display: block; margin-left: auto; margin-right: auto; width: 50% }
					h1 { text-align: center; }
					label { display: block; width: 100%; text-align: center; }
					input { width: 100%; }
				</style>
			</head>
			<html>
			    <body>
			    	<div>
			    		<h1>LionWeb Sample Emf Generator</h1>
				        <div>
				            <form>
					            «FOR prop: properties»
					            	<label for="«prop.name»">«prop.name»</label>
					            	«property(prop.value.head, prop.name)»
				                «ENDFOR»
				            </form>
				        </div>
			    	</div>
			    </body>
			</html>
		''')
		bw.close()
		
		println('''
			Saved html file «fileName» to «htmlFile.absolutePath»
		''')
	}
	
	def static dispatch property(IntValue v, String name) '''
		<input type="number" id="«name»" name="«name»" placeholder="«v.value»"><br><br>
	'''
	
	def static dispatch property(DecValue v, String name) '''
		<input type="number" id="«name»" name="«name»" placeholder="«v.value»"><br><br>
	'''
	
	def static dispatch property(StringValue v, String name) '''
    	<input type="text" id="«name»" name="«name»" placeholder="«v.value»"><br><br>
	'''
	
	def static dispatch property(BooleanValue v, String name) '''
    	<input type="checkbox" id="«name»" name="«name»" checked="«v.value»"><br><br>
	'''
}