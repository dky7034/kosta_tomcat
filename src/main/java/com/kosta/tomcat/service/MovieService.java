// MovieService.java
package com.kosta.tomcat.service;

import com.kosta.tomcat.dao.MovieDAO;
import com.kosta.tomcat.dto.MovieListDTO;

public class MovieService {
    private MovieDAO movieDAO;

    public MovieService() {
        this.movieDAO = new MovieDAO();
    }

    public MovieListDTO getNowPlayingMovies() {
        return movieDAO.fetchMovieList("now_playing");
    }

    public MovieListDTO getTopRatedMovies() {
        return movieDAO.fetchMovieList("top_rated");
    }

    public MovieListDTO getUpcomingMovies() {
        return movieDAO.fetchMovieList("upcoming");
    }

    public MovieListDTO getPopularMovies() {
        return movieDAO.fetchMovieList("popular");
    }
}