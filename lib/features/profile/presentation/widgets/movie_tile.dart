import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/poster.dart';

class MovieTile extends StatelessWidget {
  final Either<MovieDetails, TvShowDetails> movieOrTvShow;
  const MovieTile({
    Key? key,
    required this.movieOrTvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, double value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 5,
            ),
          ],
        ),
        child: movieOrTvShow.fold(
          (movie) => Poster(
            id: movie.id,
            posterPath: movie.posterPath,
          ),
          (show) => Poster(
            id: show.id,
            posterPath: show.posterPath!,
            isTvShow: true,
          ),
        ),
      ),
    );
  }
}
