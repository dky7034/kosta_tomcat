package com.kosta.tomcat;

import com.kosta.tomcat.dto.MovieDTO;
import com.kosta.tomcat.dto.MovieListDTO;
import com.kosta.tomcat.util.ApiKey;
import org.json.JSONArray;
import org.json.JSONObject;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

public class MoviePopularLists {

    public static void main(String[] args) {
        try {
            String apikey = ApiKey.getInstance().getApiKey();
            String baseUrl = "https://api.themoviedb.org/3/";
            String url = baseUrl + "movie/popular?api_key=" + apikey + "&language=ko-KR";

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("accept", "application/json")
                    .header("Authorization", "Bearer " + apikey)
                    .GET()
                    .build();

            HttpClient client = HttpClient.newHttpClient();
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            JSONObject jsonObject = new JSONObject(response.body());
            MovieListDTO movieList = parseMovieList(jsonObject);

            // 결과 출력
            System.out.println("페이지: " + movieList.getPage());
            System.out.println("총 페이지: " + movieList.getTotalPages());
            System.out.println("총 결과: " + movieList.getTotalResults());
            System.out.println("영화 목록:");
            for (MovieDTO movie : movieList.getResults()) {
                System.out.println("- " + movie.getTitle() + " (평점: " + movie.getVoteAverage() + ")");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static MovieListDTO parseMovieList(JSONObject jsonObject) {
        MovieListDTO movieList = new MovieListDTO();
        movieList.setPage(jsonObject.getInt("page"));
        movieList.setTotalPages(jsonObject.getInt("total_pages"));
        movieList.setTotalResults(jsonObject.getInt("total_results"));

        List<MovieDTO> movies = new ArrayList<>();
        JSONArray results = jsonObject.getJSONArray("results");
        for (int i = 0; i < results.length(); i++) {
            JSONObject movieJson = results.getJSONObject(i);
            MovieDTO movie = new MovieDTO();
            movie.setId(movieJson.getInt("id"));
            movie.setTitle(movieJson.getString("title"));
            movie.setOverview(movieJson.getString("overview"));
            movie.setReleaseDate(movieJson.getString("release_date"));
            movie.setVoteAverage(movieJson.getDouble("vote_average"));
            movies.add(movie);
        }
        movieList.setResults(movies);

        return movieList;
    }
}