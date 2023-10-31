package generator.kotlin;

import java.io.File
import io.lionweb.propertiesparser.PropertiesModelLoader
import io.lionweb.propertiesparser.IntValue
import io.lionweb.propertiesparser.BooleanValue
import io.lionweb.propertiesparser.StringValue

class KotlinGenerated {
	def static void main(String[] args) {
		val propertiesLoader = new PropertiesModelLoader()
		val lib = propertiesLoader.loadModel(new File("C:\\Work\\property-demo\\properties-parser\\src\\test\\resources\\issue12.json"))
		
	    println('''
			Properties
			
				«FOR v: lib.props»
					«v.name» = «propertyValue(v.value)»
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