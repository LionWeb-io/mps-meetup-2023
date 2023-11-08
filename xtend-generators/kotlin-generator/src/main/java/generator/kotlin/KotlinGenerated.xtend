package generator.kotlin;

import java.io.File
import io.lionweb.propertiesparser.PropertiesModelLoader
import io.lionweb.Properties.IntValue
import io.lionweb.Properties.BooleanValue
import io.lionweb.Properties.StringValue

class KotlinGenerated {
	def static void main(String[] args) {
	    new KotlinGenerated().generate()
	}

	def generate() {
		val propertiesLoader = new PropertiesModelLoader()
		val propertiesFile = propertiesLoader.loadModel(this.getClass().getResourceAsStream("/example1-exported.lm.json"))

	    println('''
			Properties

				«FOR prop: propertiesFile.props»
					«prop.name» = «propertyValue(prop.value.head)»
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