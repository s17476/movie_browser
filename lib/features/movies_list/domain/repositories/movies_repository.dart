import 'package:dartz/dartz.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show_list.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieList>> top20Movies();
  Future<Either<Failure, TvShowList>> top20TvShows();
  Future<Either<Failure, MovieList>> searchMovies(String query);
  Future<Either<Failure, MovieList>> loadNextPage(String query, int page);
  Future<Either<Failure, MovieList>> fetchByGenreId(int id);
  Future<Either<Failure, MovieList>> fetchNextPageByGenreId(int id, int page);
}
