package io.lionweb.propertydemo.xtendgenerators.lionweb;

import io.lionweb.lioncore.java.model.Node
import io.lionweb.lioncore.java.serialization.JsonSerialization
import io.lionweb.propertydemo.json.PropertiesLanguage
import io.lionweb.propertydemo.json.PropertiesLoader
import java.io.BufferedWriter
import java.io.File
import java.io.FileWriter
import java.util.List

class LionWebReflective {
	def static void main(String[] args) {
		new LionWebReflective().generate()
	}

	def generate() {
		val JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization()
		jsonSerialization.enableDynamicNodes

		val lang = PropertiesLanguage.getInstance()

		jsonSerialization.registerLanguage(lang.PROPERTIES_MM)
		val inputStream = new PropertiesLoader().loadInstance()
		val List<Node> nodes = jsonSerialization.deserializeToNodes(inputStream)

		val Node propertiesFile = nodes.filter[it.concept == lang.PROPERTIESFILE].head

		val fileName = "lionweb-reflective-generator"
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
			    		        «FOR prop : propertiesFile.children»
			    		        	«val propName = prop.getPropertyValue(lang.PROPERTY_NAME)»
			    		        	«val firstVal = prop.children.head»
			    		        	<label for="«propName»">«propName»</label>
			    		        	«IF firstVal.classifier == lang.INTVALUE»
			    		        		<input type="number" id="«propName»" name="«propName»" placeholder="«firstVal.getPropertyValueByName("value")»"><br><br>
			    		        	«ELSEIF firstVal.classifier == lang.BOOLEANVALUE»
			    		        		<input type="checkbox" id="«propName»" name="«propName»" checked="«firstVal.getPropertyValueByName("value")»"><br><br>
			    		        	«ELSEIF firstVal.classifier == lang.STRINGVALUE»
			    		        		<input type="text" id="«propName»" name="«propName»" placeholder="«firstVal.getPropertyValueByName("value")»"><br><br>
			    		        	«ELSEIF firstVal.classifier == lang.DECVALUE»
			    		        		<input type="number" id="«propName»" name="«propName»" placeholder="«firstVal.getPropertyValueByName("value")»"><br><br>
			    		        	«ENDIF»
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
}
