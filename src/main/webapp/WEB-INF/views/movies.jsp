<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <nav>
        <div class="logo">
            <h1><a href="/">Movie Streaming</a></h1>
        </div>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="#browse">Browse</a></li>
            <li><a href="#playlist">Playlist</a></li>
        </ul>
    </nav>

    <main>
        <header>
            <input type="text" placeholder="영화, TV 프로그램, 인물 검색">
        </header>

        <section id="movie-list">
            <h2>${listType} Movies</h2>
            <div class="card-row">
                <c:forEach var="movie" items="${movieList.results}">
                    <div class="card">
                        <img src="https://image.tmdb.org/t/p/w500${movie.posterPath}" alt="${movie.title}">
                        <div class="info">
                            <h3>${movie.title}</h3>
                            <p>Rating: ${movie.voteAverage}</p>
                            <p>${movie.overview}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
</div>
</body>
</html>
