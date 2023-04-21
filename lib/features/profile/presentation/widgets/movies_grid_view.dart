import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/domain/entities/tv_show_details.dart';
import 'movie_tile.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieDetails> movies;
  final List<TvShowDetails> shows;
  const MoviesGridView({
    Key? key,
    required this.movies,
    required this.shows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2 / 3,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 8,
        right: 8,
        bottom: 70,
      ),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        ...movies
            .map((movie) => MovieTile(movieOrTvShow: left(movie)))
            .toList(),
        ...shows
            .map((tvShow) => MovieTile(movieOrTvShow: right(tvShow)))
            .toList()
      ],
    );
  }
}
