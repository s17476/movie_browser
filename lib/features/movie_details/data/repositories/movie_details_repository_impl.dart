import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../../domain/services/movie_details_api_service.dart';

@LazySingleton(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsApiService apiService;

  MovieDetailsRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId) async {
    try {
      final MovieDetails movie = await apiService.fetchMoviedetails(movieId);
      return right(movie);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }
}
