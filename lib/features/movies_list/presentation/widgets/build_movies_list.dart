import 'package:flutter/material.dart';
import '../../domain/entities/movie_list.dart';

import 'horizontal_movies_list.dart';

List<Widget> buildMoviesLists(Map<String, MovieList> moviesLists) {
  final genres = moviesLists.keys;

  return genres.map(
    (genre) {
      final movieList = moviesLists[genre]?.results;
      if (movieList != null) {
        return HorizontalMoviesList(
          title: genre,
          movies: movieList,
        );
      }
      return const SizedBox();
    },
  ).toList();
}
