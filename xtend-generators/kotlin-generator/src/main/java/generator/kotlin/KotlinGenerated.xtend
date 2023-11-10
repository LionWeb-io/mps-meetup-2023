package generator.kotlin;

import java.io.File
import io.lionweb.propertiesparser.PropertiesModelLoader
import io.lionweb.Properties.PropertiesFile
import io.lionweb.Properties.Property
import io.lionweb.Properties.IntValue
import io.lionweb.Properties.BooleanValue
import io.lionweb.Properties.StringValue
import io.lionweb.Properties.DecValue
import java.io.BufferedWriter
import java.io.FileWriter
import io.lionweb.emf.support.InstanceLoader
import java.util.List

class KotlinGenerated {
	def static void main(String[] args) {
	    new KotlinGenerated().generate()
	}

	def generate() {
		val propertiesLoader = new PropertiesModelLoader()
//		val inputStream = this.getClass().getResourceAsStream("/example1-exported.lm.json")
		val inputStream = new InstanceLoader().load()
		val PropertiesFile propsFile = propertiesLoader.loadModel(inputStream)
		val List<Property> properties = propsFile.props

		val fileName = "kotlin-generator"
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