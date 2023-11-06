package io.lionweb.emf.support;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import io.lionweb.lioncore.java.language.Concept;
import io.lionweb.lioncore.java.language.Language;
import io.lionweb.lioncore.java.model.Node;
import io.lionweb.lioncore.java.serialization.JsonSerialization;

import java.io.*;
import java.util.List;
import java.util.Objects;

public class PropertiesLanguage {
	  public static Language PROPERTIES_MM;
	  public static Concept PROPERTY;
	  public static Concept PROPERTIESFILE;
	  public static Concept VALUE;
	  public static Concept BOOLEANVALUE;
	  public static Concept DECVALUE;
	  public static Concept INTVALUE;
	  public static Concept STRINGVALUE;

	  static {
	    InputStream inputStream;
		try {
			File propertiesFile = new File("C:\\Work\\property-demo\\properties-parser\\properties.lmm.json");
			inputStream = new FileInputStream(propertiesFile);
			JsonElement jsonElement = JsonParser.parseReader(new InputStreamReader(inputStream));
		    JsonSerialization jsonSerialization = JsonSerialization.getStandardSerialization();
		    List<Node> unserializedNodes = jsonSerialization.deserializeToNodes(jsonElement);
		    PROPERTIES_MM =
		        unserializedNodes.stream()
		            .filter(e -> e instanceof Language)
		            .map(e -> (Language) e)
		            .findFirst()
		            .get();
		    PROPERTY = PROPERTIES_MM.getConceptByName("Property");
		    PROPERTIESFILE = PROPERTIES_MM.getConceptByName("PropertiesFile");
		    VALUE = PROPERTIES_MM.getConceptByName("Value");
		    BOOLEANVALUE = PROPERTIES_MM.getConceptByName("BooleanValue");
		    DECVALUE = PROPERTIES_MM.getConceptByName("DecValue");
		    INTVALUE = PROPERTIES_MM.getConceptByName("IntValue");
		    STRINGVALUE = PROPERTIES_MM.getConceptByName("StringValue");

		    PROPERTIESFILE
		        .allFeatures()
		        .forEach(
		            f ->
		                Objects.requireNonNull(
		                    f.getKey(),
		                    "Feature " + f + " in " + f.getContainer() + " should not have a null key"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	  }
}
