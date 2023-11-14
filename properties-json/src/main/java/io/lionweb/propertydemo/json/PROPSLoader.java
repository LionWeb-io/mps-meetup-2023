package io.lionweb.propertydemo.json;

import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class PROPSLoader {
    private boolean loadFromFile;

    public PROPSLoader() {
        loadFromFile = System.getProperties().containsKey("PROPS_LOAD_FROM_FILE");
    }

    public InputStream loadInstance() {
        if (loadFromFile) {
            return this.getClass().getResourceAsStream("/example1-exported.lm.json");
        }

        URI uri = URI.create("http://127.0.0.1:63320/lionweb/bulk?modelRef=r%3A5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)");
        try {
            HttpResponse<InputStream> response = HttpClient.newHttpClient().send(HttpRequest.newBuilder(uri).GET().build(), HttpResponse.BodyHandlers.ofInputStream());
            return response.body();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public InputStream loadLanguage() {
        if (loadFromFile) {
            return this.getClass().getResourceAsStream("/PROPS.lmm.json");
        }

        URI uri = URI.create(
		  "http://127.0.0.1:63320/lionweb/language?moduleRef=28832bdf-0e25-363c-b286-c7457d9f9c90(io.lionweb.PROPS)"
		);
        try {
            HttpResponse<InputStream> response = HttpClient.newHttpClient().send(HttpRequest.newBuilder(uri).GET().build(), HttpResponse.BodyHandlers.ofInputStream());
            return response.body();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isLoadFromFile() {
        return loadFromFile;
    }

    public void setLoadFromFile(boolean loadFromFile) {
        this.loadFromFile = loadFromFile;
    }
}
