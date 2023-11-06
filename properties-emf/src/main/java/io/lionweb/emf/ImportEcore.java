package io.lionweb.emf;

import java.io.File;
import java.io.IOException;
import java.util.Collections;

import io.lionweb.lioncore.java.emf.mapping.ConceptsToEClassesMapping;
import io.lionweb.lioncore.java.language.LionCoreBuiltins;
import org.eclipse.emf.ecore.*;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import io.lionweb.lioncore.java.language.Language;
import io.lionweb.lioncore.java.emf.EMFMetamodelExporter;
import io.lionweb.lioncore.java.serialization.JsonSerialization;

public class ImportEcore {
	public static void main(String[] args) throws IOException {
	    Language propertiesLang =
	            (Language)
	                JsonSerialization.getStandardSerialization()
	                    .deserializeToNodes(new File(".\\..\\properties-parser\\properties.lmm.json"))
	                    .get(0);

		ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();

		conceptMapper.registerMapping(LionCoreBuiltins.getNode(), EcorePackage.eINSTANCE.getEObject());

		EPackage builtinsEPackage = EcoreFactory.eINSTANCE.createEPackage();
		builtinsEPackage.setName("LionCore_builtins");
		builtinsEPackage.setNsURI("LionCore-builtins");
		builtinsEPackage.setNsPrefix("LionCore-builtins");

		EClass eCoreINamed = EcoreFactory.eINSTANCE.createEClass();
		eCoreINamed.setName("INamed");
		eCoreINamed.setInterface(true);
		eCoreINamed.setAbstract(true);
		builtinsEPackage.getEClassifiers().add(eCoreINamed);

		EAttribute eCoreINamedName = EcoreFactory.eINSTANCE.createEAttribute();
		eCoreINamedName.setName("name");
		eCoreINamedName.setEType(EcorePackage.eINSTANCE.getEString());
		eCoreINamed.getEStructuralFeatures().add(eCoreINamedName);

		conceptMapper.registerMapping(LionCoreBuiltins.getINamed(), eCoreINamed);

        EMFMetamodelExporter ecoreExporter = new EMFMetamodelExporter(conceptMapper);
        EPackage propertyPkg = ecoreExporter.exportLanguage(propertiesLang);

		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());

        ResourceSet resourceSet = new ResourceSetImpl();

        Resource resource = resourceSet.createResource(URI.createFileURI(".\\model\\properties.ecore"));
        resource.getContents().add(propertyPkg);
        resource.getContents().add(builtinsEPackage);
        resource.save(Collections.emptyMap());
	}

}
