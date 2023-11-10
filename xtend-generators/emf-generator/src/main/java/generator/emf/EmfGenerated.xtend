package generator.emf;

import io.lionweb.emf.io_lionweb_Properties.BooleanValue
import io.lionweb.emf.io_lionweb_Properties.DecValue
import io.lionweb.emf.io_lionweb_Properties.IntValue
import io.lionweb.emf.io_lionweb_Properties.Io_lionweb_PropertiesPackage
import io.lionweb.emf.io_lionweb_Properties.PropertiesFile
import io.lionweb.emf.io_lionweb_Properties.Property
import io.lionweb.emf.io_lionweb_Properties.StringValue
import io.lionweb.emf.support.InstanceLoader
import io.lionweb.emf.support.PropertiesLanguage
import io.lionweb.java.emf.builtins.BuiltinsPackage
import io.lionweb.lioncore.java.emf.EMFModelExporter
import io.lionweb.lioncore.java.emf.mapping.ConceptsToEClassesMapping
import io.lionweb.lioncore.java.model.Node
import io.lionweb.lioncore.java.serialization.JsonSerialization
import java.io.BufferedWriter
import java.io.File
import java.io.FileWriter
import java.util.List
import java.util.stream.Collectors
import org.eclipse.emf.ecore.resource.Resource

class EmfGenerated {
	def static void main(String[] args) {
		new EmfGenerated().generate()
	}

	def generate() {
		BuiltinsPackage.eINSTANCE.getNsURI();
		Io_lionweb_PropertiesPackage.eINSTANCE.getNsURI();

		val JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization();

		val lang = PropertiesLanguage.getInstance()

		jsonSerialization.registerLanguage(lang.PROPERTIES_MM);
		jsonSerialization.getInstantiator().enableDynamicNodes();
//		val inputStream = this.getClass().getResourceAsStream("/example1-exported.lm.json")
		val inputStream = new InstanceLoader().load()
		val nodes = jsonSerialization.deserializeToNodes(inputStream);
		val List<Node> roots = nodes.stream().filter[it.parent === null].collect(Collectors.toList());

		val ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();
		conceptMapper.registerMapping(lang.PROPERTIES_MM, Io_lionweb_PropertiesPackage.eINSTANCE);

		val EMFModelExporter emfExporter = new EMFModelExporter(conceptMapper);
		val Resource resource = emfExporter.exportResource(roots);

		val PropertiesFile propsFile = resource.contents.filter(PropertiesFile).head
		val List<Property> properties = propsFile.props

		val fileName = "emf-generator"
		val htmlFile = new File('''«fileName»-index.html''')
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
			    		<h1>LionWeb Sample «fileName»</h1>
			    		   <div>
			    		       <form>
			    		        «FOR prop : properties»
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
