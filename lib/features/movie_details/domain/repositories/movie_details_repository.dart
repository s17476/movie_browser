import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId);
}
