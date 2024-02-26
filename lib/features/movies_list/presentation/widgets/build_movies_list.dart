import 'package:flutter/material.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/horizontal_movies_list.dart';

List<Widget> buildMoviesLists(Map<String, MovieList> moviesLists) {
  final genres = moviesLists.keys;

  return genres.map(
    (genre) {
      final movieList = moviesLists[genre]?.results;
      if (movieList != null) {
        return HorizontalMoviesList(
          key: ValueKey(genre),
          title: genre,
          movies: movieList,
        );
      }
      return const SizedBox();
    },
  ).toList();
}
