import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/movie_list.dart';
import '../../domain/repositories/movies_repository.dart';
import '../../domain/services/movies_api_service.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesApiService apiService;

  MoviesRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, MovieList>> searchMovies(String query) async {
    try {
      final MovieList movieList = await apiService.searchMovies(query);
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, MovieList>> loadNextPage(
      String query, int page) async {
    try {
      final MovieList movieList =
          await apiService.loadNextResultsPage(query, page);
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, MovieList>> top20Movies() async {
    try {
      final MovieList movieList = await apiService.top20Movies();
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }
}
