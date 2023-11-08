package io.lionweb.emf;

import io.lionweb.lioncore.java.emf.EMFMetamodelExporter;
import io.lionweb.lioncore.java.language.Language;
import io.lionweb.lioncore.java.serialization.JsonSerialization;
import org.eclipse.emf.codegen.ecore.genmodel.GenModel;
import org.eclipse.emf.codegen.ecore.genmodel.GenModelFactory;
import org.eclipse.emf.codegen.ecore.genmodel.GenModelPackage;
import org.eclipse.emf.codegen.ecore.genmodel.GenPackage;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;

public class ImportEcore {
	public static final String LIONCORE_RESOURCE_PATH = "/properties.lmm.json";
	public static final String ECORE_FILE_NAME = "properties";

	public static final String JAVA_OUTPUT_DIR = "/src-gen/main/java";
	public static final String MODEL_OUTPUT_DIR = "src-gen/main/model";

	private final File baseDir;
	private final String projectName;
	private final ResourceSet resourceSet;

	/**
	 *
	 * @param args
	 * 	[0] - absolute path of this project
	 * 	[1] - name of this project
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		new ImportEcore(new File(args[0]), args[1]).importEcore();
	}

	ImportEcore(File baseDir, String projectName) {
		this.baseDir = baseDir;
		this.projectName = projectName;
		this.resourceSet = new ResourceSetImpl();
	}

	public void importEcore() throws Exception {
		Language lionCoreLanguage = loadLionCore();

		emfSetup();

		GenPackage builtinsGenPackage = lionCoreSetup();

		EPackage propertyPkg = exportLionCoreToEcore(lionCoreLanguage);

		GenModel genModel = createGenModel(builtinsGenPackage, propertyPkg);


		File ecoreFile = new File(baseDir,MODEL_OUTPUT_DIR+"/" + ECORE_FILE_NAME + ".ecore");
		saveEmfResource(ecoreFile, propertyPkg);

		genModel.getForeignModel().add(ecoreFile.getName());

		File genmodelFile = new File(baseDir, MODEL_OUTPUT_DIR +"/" + ECORE_FILE_NAME + ".genmodel");
		saveEmfResource(genmodelFile, genModel);
	}

	private Language loadLionCore() {
		Language propertiesLang =
				(Language)
						JsonSerialization.getStandardSerialization()
								.deserializeToNodes(this.getClass().getResourceAsStream(LIONCORE_RESOURCE_PATH))
								.get(0);
		return propertiesLang;
	}

	private static void emfSetup() {
		GenModelPackage.eINSTANCE.getNsURI();
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("genmodel", new EcoreResourceFactoryImpl());
	}

	private GenPackage lionCoreSetup() throws IOException {
		loadJavaResource("/builtins.ecore", URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.ecore"));
		Resource builtinsGenResource = loadJavaResource("/builtins.genmodel", URI.createURI("platform:/resource/io.lionweb.java.emf.builtins/builtins.genmodel"));
		GenModel builtinsGenModel = (GenModel) builtinsGenResource.getContents().get(0);
		GenPackage builtinsGenPackage = builtinsGenModel.getGenPackages().get(0);
		return builtinsGenPackage;
	}

	private Resource loadJavaResource(String javaResourcePath, URI ecoreUri) throws IOException {
		InputStream inputStream = this.getClass().getResourceAsStream(javaResourcePath);
		Resource eResource = resourceSet.createResource(ecoreUri);
		eResource.load(inputStream, Collections.emptyMap());
		return eResource;
	}

	private static EPackage exportLionCoreToEcore(Language propertiesLang) {
		EMFMetamodelExporter ecoreExporter = new EMFMetamodelExporter();
		EPackage propertyPkg = ecoreExporter.exportLanguage(propertiesLang);
		return propertyPkg;
	}

	private GenModel createGenModel(GenPackage builtinsGenPackage, EPackage propertyPkg) {
		GenModel genModel = GenModelFactory.eINSTANCE.createGenModel();
		genModel.setModelDirectory("/"+ projectName + JAVA_OUTPUT_DIR);
//		System.out.println("used: "+ genModel.getUsedGenPackages());
		genModel.getUsedGenPackages().add(builtinsGenPackage);
		genModel.initialize(Collections.singleton(propertyPkg));
//		System.out.println("missing: " +genModel.getMissingPackages());
		GenPackage genPackage = genModel.findGenPackage(propertyPkg);
		genPackage.setBasePackage(this.getClass().getPackageName());
//		System.out.println("packages: "+ genModel.getGenPackages().size());
		return genModel;
	}

	private void saveEmfResource(File ecoreFile, EObject contents) throws IOException {
		URI ecoreUri = URI.createFileURI(ecoreFile.getCanonicalPath());
		System.out.println("storing "+ecoreFile.getName()+" file to "+ ecoreUri.toFileString());
		Resource eResource = resourceSet.createResource(ecoreUri);
		eResource.getContents().add(contents);
		eResource.save(Collections.emptyMap());
	}
}
