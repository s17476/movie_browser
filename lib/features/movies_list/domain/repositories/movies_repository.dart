import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movie_list.dart';
import '../entities/tv_show_list.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MovieList>> top20Movies();
  Future<Either<Failure, TvShowList>> top20TvShows();
  Future<Either<Failure, MovieList>> searchMovies(String query);
  Future<Either<Failure, MovieList>> loadNextPage(String query, int page);
  Future<Either<Failure, MovieList>> fetchByGenreId(int id);
}
