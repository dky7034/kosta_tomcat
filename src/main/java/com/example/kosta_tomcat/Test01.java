package com.example.kosta_tomcat;

import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class Test01 {

    public static void main(String[] args) {
        try {
            ApiToken apiToken = new ApiToken();
            String url = "https://api.themoviedb.org/3/authentication";
            String token = apiToken.getApiToken();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("accept", "application/json")
                    .header("Authorization", "Bearer " + token)
                    .GET()
                    .build();

            HttpClient client = HttpClient.newHttpClient();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            System.out.println(response.body());

            JSONObject jsonObject = new JSONObject(response.body());
            System.out.println(jsonObject.get("success"));


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
