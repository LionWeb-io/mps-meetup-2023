package io.lionweb.emf.support;

import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class InstanceLoader {
    public InputStream load() {
        URI uri = URI.create("http://127.0.0.1:63320/lionweb/bulk?modelRef=r%3A5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)");
        try {
            HttpResponse<InputStream> response = HttpClient.newHttpClient().send(HttpRequest.newBuilder(uri).GET().build(), HttpResponse.BodyHandlers.ofInputStream());
            return response.body();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
