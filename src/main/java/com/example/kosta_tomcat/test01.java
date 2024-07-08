package com.example.kosta_tomcat;

import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class test01 {

    public static void main(String[] args) {
        try {
            String kdg_apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODI4NGYxMGI3MTBmMTUxOTRjZDgwMDY5MjgzYTBhYSIsIm5iZiI6MTcyMDQ0OTQ0Ny4xMTEwOTIsInN1YiI6IjY1YjA1NDY2MTU4Yzg1MDBhYzFkNmQxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1kXFvsj_RnOgh0Cl4XjUTCx9Xjxl8yC0k9gWw3pXFAI";
            String url = "https://api.themoviedb.org/3/authentication";

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("accept", "application/json")
                    .header("Authorization", "Bearer " + kdg_apiKey)
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
