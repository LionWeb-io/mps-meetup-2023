package generator.kotlin;

import java.io.File
import nl.f1re.emf.library.kotlin.custom.GuideBookWriter
import nl.f1re.emf.library.kotlin.custom.LibraryLoader
import nl.f1re.emf.library.kotlin.custom.SpecialistBookWriter
import nl.f1re.emf.library.kotlin.custom.Writer

class KotlinGenerated {
	def static void main(String[] args) {
		val libLoader = new LibraryLoader()
		val lib = libLoader.loadLibraryFromLionWebFile(new File(".\\..\\bobslibrary.json"))
		
	    println('''
			Library «lib.name»
			
				«FOR book: lib.books»
					Book: «book.title»
				«ENDFOR»
				«FOR w: lib.writers»
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