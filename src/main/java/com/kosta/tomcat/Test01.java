package com.kosta.tomcat;

import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class Test01 {

    public static void main(String[] args) {
        try {
            ApiKey apiKey = new ApiKey();
            String url = "https://api.themoviedb.org/3/person/popular?api_key=" + apiKey.getApiKey();
            String token = apiKey.getApiKey();
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
            System.out.println(jsonObject.get("page"));

//            System.out.println("응답 바디의 클래스: " + response.body().getClass());


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
