package com.kosta.tomcat.controller;

import com.kosta.tomcat.dto.MovieListDTO;
import com.kosta.tomcat.service.MovieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/movies/*")
public class MovieController extends HttpServlet {
    private MovieService movieService;

    public void init() {
        movieService = new MovieService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        MovieListDTO movieList = null;
        String displayType = null;

        switch (pathInfo) {
            case "/now-playing":
                movieList = movieService.getNowPlayingMovies();
                displayType = "현재 상영 중인";
                break;
            case "/top-rated":
                movieList = movieService.getTopRatedMovies();
                displayType = "최고 평점";
                break;
            case "/upcoming":
                movieList = movieService.getUpcomingMovies();
                displayType = "개봉 예정";
                break;
            case "/popular":
                movieList = movieService.getPopularMovies();
                displayType = "인기";
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
        }

        request.setAttribute("movieList", movieList);
        request.setAttribute("listType", displayType);
        request.getRequestDispatcher("/WEB-INF/views/movies.jsp").forward(request, response);
    }
}
