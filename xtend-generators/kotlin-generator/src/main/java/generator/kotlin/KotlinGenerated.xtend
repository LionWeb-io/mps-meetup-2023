package generator.kotlin;

import java.io.File
import io.lionweb.propertiesparser.PropertiesModelLoader
import io.lionweb.propertiesparser.IntValue
import io.lionweb.propertiesparser.BooleanValue
import io.lionweb.propertiesparser.StringValue

class KotlinGenerated {
	def static void main(String[] args) {
		val propertiesLoader = new PropertiesModelLoader()
		val propertiesFile = propertiesLoader.loadModel(new File(".\\properties-parser\\examples\\example1-exported.lm.json"))
		
	    println('''
			Properties
			
				«FOR prop: propertiesFile.props»
					«prop.name» = «propertyValue(prop.value)»
				«ENDFOR»
	    ''')
	}
	
	def static dispatch propertyValue(IntValue v) '''
		number: «v.value»
	'''
	
	def static dispatch propertyValue(BooleanValue v) '''
		boolean: «v.value»
	'''
	
	def static dispatch propertyValue(StringValue v) '''
		string: «v.value»
	'''
	
}