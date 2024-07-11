package com.kosta.tomcat.util;

public class ApiKey {
    private static ApiKey instance;
    private final String apiKey;

    private ApiKey() {
        this.apiKey = "98284f10b710f15194cd80069283a0aa";
    }

    public static ApiKey getInstance() {
        if (instance == null) {
            instance = new ApiKey();
        }
        return instance;
    }

    public String getApiKey() {
        return apiKey;
    }
}