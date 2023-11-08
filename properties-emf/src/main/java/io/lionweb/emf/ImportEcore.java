package io.lionweb.emf;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import io.lionweb.java.emf.builtins.BuiltinsPackage;
import org.eclipse.core.runtime.Path;
import org.eclipse.emf.codegen.ecore.genmodel.*;
import org.eclipse.emf.common.util.BasicMonitor;
import org.eclipse.emf.common.util.Monitor;
import org.eclipse.emf.ecore.*;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.plugin.EcorePlugin;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.URIConverter;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.util.ExtendedMetaData;
import org.eclipse.emf.ecore.xmi.XMLResource;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import io.lionweb.lioncore.java.language.Language;
import io.lionweb.lioncore.java.emf.EMFMetamodelExporter;
import io.lionweb.lioncore.java.serialization.JsonSerialization;

import org.eclipse.emf.ecore.xmi.impl.XMLResourceImpl;
import org.eclipse.emf.importer.ModelImporter;
import org.eclipse.emf.importer.ecore.EcoreImporter;

public class ImportEcore {
	public static void main(String[] args) throws Exception {
		new ImportEcore().importEcore(new File(args[0]));
	}

	public void importEcore(File baseDir) throws Exception {
	    Language propertiesLang =
	            (Language)
	                JsonSerialization.getStandardSerialization()
	                    .deserializeToNodes(this.getClass().getResourceAsStream("/properties.lmm.json"))
	                    .get(0);

//		ConceptsToEClassesMapping conceptMapper = new ConceptsToEClassesMapping();
//
//		conceptMapper.registerMapping(LionCoreBuiltins.getNode(), EcorePackage.eINSTANCE.getEObject());
//
//		EPackage builtinsEPackage = EcoreFactory.eINSTANCE.createEPackage();
//		builtinsEPackage.setName("LionCore_builtins");
//		builtinsEPackage.setNsURI("LionCore-builtins");
//		builtinsEPackage.setNsPrefix("LionCore-builtins");
//
//		EClass eCoreINamed = EcoreFactory.eINSTANCE.createEClass();
//		eCoreINamed.setName("INamed");
//		eCoreINamed.setInterface(true);
//		eCoreINamed.setAbstract(true);
//		builtinsEPackage.getEClassifiers().add(eCoreINamed);
//
//		EAttribute eCoreINamedName = EcoreFactory.eINSTANCE.createEAttribute();
//		eCoreINamedName.setName("name");
//		eCoreINamedName.setEType(EcorePackage.eINSTANCE.getEString());
//		eCoreINamed.getEStructuralFeatures().add(eCoreINamedName);
//
//		conceptMapper.registerMapping(LionCoreBuiltins.getINamed(), eCoreINamed);

//        EMFMetamodelExporter ecoreExporter = new EMFMetamodelExporter(conceptMapper);
		EcorePackage.eINSTANCE.getNsURI();
		GenModelPackage.eINSTANCE.getNsURI();
		BuiltinsPackage.eINSTANCE.getNsURI();

		System.out.println(EcoreUtil.getURI(BuiltinsPackage.eINSTANCE));

		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("genmodel", new EcoreResourceFactoryImpl());

		URI builtinsEcoreUri = URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.ecore");
		URI builtinsGenmodelUri = URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.genmodel");
		String builtinsNsString = BuiltinsPackage.eINSTANCE.getNsURI();
		EcorePlugin.getEPackageNsURIToDynamicModelLocationMap(true).put(builtinsNsString, builtinsEcoreUri);
		EcorePlugin.getEPackageNsURIToGenModelLocationMap(true).put(builtinsNsString, builtinsGenmodelUri);
		EcorePlugin.getEPackageNsURIToDynamicModelLocationMap(false).put(builtinsNsString, builtinsEcoreUri);
		EcorePlugin.getEPackageNsURIToGenModelLocationMap(false).put(builtinsNsString, builtinsGenmodelUri);

		URI builtinsNsUri = URI.createURI(builtinsNsString);
		EcorePlugin.computePlatformURIMap(true).put(builtinsNsUri, builtinsEcoreUri);
		EcorePlugin.computePlatformURIMap(true).put(builtinsNsUri, builtinsGenmodelUri);
		EcorePlugin.computePlatformURIMap(false).put(builtinsNsUri, builtinsEcoreUri);
		EcorePlugin.computePlatformURIMap(false).put(builtinsNsUri, builtinsGenmodelUri);

//		EcorePlugin.computePlatformURIMap(true).put(URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.ecore#/"), URI.createURI(BuiltinsPackage.eINSTANCE.getNsURI()));
//		EcorePlugin.computePlatformURIMap(true).put(URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.ecore#/"), EcoreUtil.getURI(BuiltinsPackage.eINSTANCE));

		ResourceSet resourceSet = new ResourceSetImpl();

		InputStream builtinsEcoreStream = this.getClass().getResourceAsStream("/builtins.ecore");
		Resource builtinsEcoreResource = resourceSet.createResource(builtinsEcoreUri);
		builtinsEcoreResource.load(builtinsEcoreStream, Collections.emptyMap());


		InputStream builtinsGenmodelStream = this.getClass().getResourceAsStream("/builtins.genmodel");
		Resource builtinsGenResource = resourceSet.createResource(builtinsGenmodelUri);
		builtinsGenResource.load(builtinsGenmodelStream, Collections.emptyMap());

		URIConverter uriConverter = resourceSet.getURIConverter();
//		uriConverter.getURIMap().put(URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.ecore"), EcoreUtil.getURI(BuiltinsPackage.eINSTANCE));

		EMFMetamodelExporter ecoreExporter = new EMFMetamodelExporter();
        EPackage propertyPkg = ecoreExporter.exportLanguage(propertiesLang);

		GenModel genModel = GenModelFactory.eINSTANCE.createGenModel();
		genModel.setModelDirectory("/properties-emf/src-gen/main/java");
		GenModel builtinsGenmodel = (GenModel) builtinsGenResource.getContents().get(0);
//		System.out.println("BEFORE:::::");
//		builtinsGenmodel.eAllContents().forEachRemaining(e -> {
//			if(e.eIsProxy()) {
//				System.out.println("proxy: "+ e );
//			} else if (e instanceof GenBase){
//				System.out.println(EcoreUtil.resolve(((GenBase) e).getEcoreModelElement(), resourceSet));
//			}
//		});
//		System.out.println("AFTER:::::");
//		EcoreUtil.resolveAll(		resourceSet		);
//		builtinsGenmodel.eAllContents().forEachRemaining(e -> {
//			if(e.eIsProxy()) {
//				System.out.println("proxy: "+ e );
//			}
//		});
		GenPackage builtinsGenPackage = builtinsGenmodel.getGenPackages().get(0);
//		builtinsGenPackage.setEcorePackage(BuiltinsPackage.eINSTANCE);
		System.out.println("used: "+ genModel.getUsedGenPackages());
		genModel.getStaticGenPackages().add(builtinsGenPackage);
//		GenPackage ecoreGenPackage = genModel.findGenPackage(EcorePackage.eINSTANCE);
//		builtinsGenmodel.getContents().add(ecoreGenPackage);
//		genModel.getUsedGenPackages().add(ecoreGenPackage);
		genModel.getUsedGenPackages().add(builtinsGenPackage);
		genModel.initialize(Collections.singleton(propertyPkg));
		System.out.println("missing: " +genModel.getMissingPackages());
//		genModel.getForeignModel().add(builtinsGenmodelUri.toString());
//		genModel.addPseudoImport("myPseudoImport");
		GenPackage genPackage = genModel.findGenPackage(propertyPkg);
		genPackage.setBasePackage(this.getClass().getPackageName());
		System.out.println("packages: "+ genModel.getGenPackages().size());


//		ResourceSet resourceSet = new ResourceSetImpl();

		File ecoreFile = new File(baseDir,"src/main/model/properties.ecore");
		URI ecoreUri = URI.createFileURI(ecoreFile.getCanonicalPath());
		System.out.println("storing ecore file to "+ ecoreUri.toFileString());
		Resource ecoreResource = resourceSet.createResource(ecoreUri);
        ecoreResource.getContents().add(propertyPkg);
        ecoreResource.save(Collections.emptyMap());

		genModel.getForeignModel().add(ecoreFile.getName());

		File genmodelFile = new File(baseDir,"src/main/model/properties.genmodel");
		URI genmodelUri = URI.createFileURI(genmodelFile.getCanonicalPath());
		System.out.println("storing genmodel file to "+ genmodelUri.toFileString());
		Resource genmodelResource = resourceSet.createResource(genmodelUri);
        genmodelResource.getContents().add(genModel);
        genmodelResource.save(Collections.emptyMap());


//		resource.getContents().add(builtinsEPackage);
//
//		EcoreImporter ecoreImporter = new EcoreImporter();
//
//		Map<String, URI> platformResourceMap = EcorePlugin.getPlatformResourceMap();
//		platformResourceMap.put("C:", URI.createFileURI("c:/"));
//		Map<String, URI> ePackageNsURIToGenModelLocationMap = EcorePlugin.getEPackageNsURIToGenModelLocationMap(true);
//
//		URI builtinsUri = URI.createFileURI("C:\\Users\\Niko\\git\\lionweb\\lioncore-java\\emf-builtins\\src\\main\\model\\builtins.genmodel");
//
//		ePackageNsURIToGenModelLocationMap.put(BuiltinsPackage.eINSTANCE.getNsURI(), builtinsUri);
//
////				ecoreImporter.createResourceSet();
////		Resource builtinsRes = ecoreImporter.getGenModelResourceSet().createResource(builtinsUri);
////		builtinsRes.getContents().add(BuiltinsPackage.eINSTANCE);
//
//
////		IFile[] filesForLocationURI = ResourcesPlugin.getWorkspace().getRoot().findFilesForLocationURI(java.net.URI.create("./src/main/model/properties.ecore"));
//		ecoreImporter.setModelFile(new FakeFile(genmodelFile));
////		ecoreImporter.computeEPackages(new BasicMonitor());
////		ecoreImporter.adjustEPackages(new BasicMonitor());
//		ResourceSet rsX = ecoreImporter.createResourceSet();
//		ecoreImporter.setGenModelFileName("properties.genmodel");
//		ecoreImporter.setGenModelContainerPath(new Path(genmodelFile.getParentFile().getAbsolutePath()));
//		ecoreImporter.prepareGenModelAndEPackages(new BasicMonitor());
//		ecoreImporter.addGenModelToResource(true);
//		//ecoreImporter.saveGenModelAndEPackages(new BasicMonitor());
//		GenModel genModel = ecoreImporter.getGenModel();
//		List<EPackage> ePackages = ecoreImporter.getEPackages();
//		System.out.println(ePackages);
//
//		System.out.println(rsX.getResources().size());
//
//
//		File genModelFile = new File("./src/main/model/properties.genmodel");
//		Resource genModelRes = rsX.createResource(URI.createFileURI(genModelFile.getCanonicalPath()));
//		genModelRes.getContents().add(genModel);
//		System.out.println("storing genmodel file to "+ genModelRes.getURI().toFileString());
//		genModelRes.save(Collections.emptyMap());
	}

//	public Resource enforceStatement(InputStream instancestream,InputStream
//			bicsstream){
////ResourceImpl resource=new ResourceImpl();
//		XMLResourceImpl resource=new XMLResourceImpl();
//
//		resource.getDefaultSaveOptions().put(XMLResource.OPTION_EXTENDED_META_DATA, ExtendedMetaData.INSTANCE);
//
//		resource.getDefaultLoadOptions().put(XMLResource.OPTION_EXTENDED_META_DATA,ExtendedMetaData.INSTANCE);
//
//
//		resource.getDefaultSaveOptions().put(XMLResource.OPTION_SCHEMA_LOCATION,				Boolean.TRUE);
//
//		resource.getDefaultSaveOptions().put(XMLResource.OPTION_USE_ENCODED_ATTRIBUTE_STYLE, Boolean.TRUE);
//
//
//		resource.getDefaultLoadOptions().put(XMLResource.OPTION_USE_LEXICAL_HANDLER,				Boolean.TRUE);
//		try{
//resource.load(bicsstream,(Map)null);
////			resource.doLoad(bicsstream,(Map)null);
//
//			return resource;
//		}catch(Exception e){
//			e.printStackTrace();
//			return (_icsr=new Result(Result.RESULT_UNKNOWN));
//		}
}
