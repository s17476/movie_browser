import 'package:dartz/dartz.dart';
import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieList>> top20Movies();
  Future<Either<Failure, MovieList>> searchMovies(String query);
  Future<Either<Failure, MovieList>> loadNextPage(String query, int page);
}
