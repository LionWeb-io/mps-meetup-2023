package io.lionweb.propertydemo.xtendgenerators.kotlin;

import java.io.File
import io.lionweb.propertydemo.parser.PropertiesModelLoader
import io.lionweb.PROPS.PropertiesFile
import io.lionweb.PROPS.Property
import io.lionweb.PROPS.IntValue
import io.lionweb.PROPS.BooleanValue
import io.lionweb.PROPS.StringValue
import io.lionweb.PROPS.DecValue
import java.io.BufferedWriter
import java.io.FileWriter
import io.lionweb.propertydemo.json.PROPSLoader
import java.util.List

class KotlinGenerated {
	def static void main(String[] args) {
	    new KotlinGenerated().generate()
	}

	def generate() {
		// Load model from MPS
		val propertiesLoader = new PropertiesModelLoader()
		val inputStream = new PROPSLoader().loadInstance()

		// Find entry point
		val PropertiesFile propsFile = propertiesLoader.loadModel(inputStream)
		val List<Property> properties = propsFile.props

		// Setup file output
		val fileName = "kotlin-generator"
		val htmlFile = new File('''«fileName»-index.html''')
		val bw = new BufferedWriter(new FileWriter(htmlFile))

		// Generate
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
			    		        	«property(prop.value, prop.name)»
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
