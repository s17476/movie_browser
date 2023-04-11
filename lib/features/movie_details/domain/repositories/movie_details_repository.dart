import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movie_details.dart';
import '../entities/movie_genre_list.dart';
import '../entities/movie_image_list.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId);
  Future<Either<Failure, MovieImageList>> fetchMovieImages(int movieId);
  Future<Either<Failure, MovieGenreList>> fetchMovieGenres();
}
