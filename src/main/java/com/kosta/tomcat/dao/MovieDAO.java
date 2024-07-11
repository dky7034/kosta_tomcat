// MovieDAO.java
package com.kosta.tomcat.dao;

import com.kosta.tomcat.dto.MovieDTO;
import com.kosta.tomcat.dto.MovieListDTO;
import com.kosta.tomcat.util.ApiKey;
import com.kosta.tomcat.util.HttpUtil;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    private static final String BASE_URL = "https://api.themoviedb.org/3/movie/";

    public MovieListDTO fetchMovieList(String listType) {
        String url = BASE_URL + listType + "?api_key=" + ApiKey.getInstance().getApiKey() + "&language=ko-KR";
        String jsonResponse = HttpUtil.sendGetRequest(url);
        return parseMovieList(new JSONObject(jsonResponse));
    }

    private MovieListDTO parseMovieList(JSONObject jsonObject) {
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
            movie.setPosterPath(movieJson.getString("poster_path"));
            movies.add(movie);
        }
        movieList.setResults(movies);

        return movieList;
    }
}