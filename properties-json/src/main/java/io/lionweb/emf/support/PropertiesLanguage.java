package io.lionweb.emf.support;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import io.lionweb.lioncore.java.language.Concept;
import io.lionweb.lioncore.java.language.Language;
import io.lionweb.lioncore.java.language.Property;
import io.lionweb.lioncore.java.model.Node;
import io.lionweb.lioncore.java.serialization.JsonSerialization;

import java.io.*;
import java.util.List;
import java.util.Objects;

public class PropertiesLanguage {
    private static PropertiesLanguage INSTANCE = null;

    public Language PROPERTIES_MM;
    public Concept PROPERTY;
    public Property PROPERTY_NAME;
    public Concept PROPERTIESFILE;
    public Concept VALUE;
    public Concept BOOLEANVALUE;
    public Concept DECVALUE;
    public Concept INTVALUE;
    public Concept STRINGVALUE;

    private PropertiesLanguage() {
        try (InputStream inputStream = this.getClass().getResourceAsStream("/properties.lmm.json")) {
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
            PROPERTY_NAME = PROPERTY.getPropertyByName("name");
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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static PropertiesLanguage getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new PropertiesLanguage();
        }
        return INSTANCE;
    }
}
