import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/movie_list.dart';
import '../../domain/entities/tv_show_list.dart';
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
    return performApiCall(apiService.top20Movies);
  }

  @override
  Future<Either<Failure, TvShowList>> top20TvShows() async {
    return performApiCall(apiService.top20TvShows);
  }

  @override
  Future<Either<Failure, MovieList>> fetchByGenreId(int id) async {
    try {
      final MovieList movieList = await apiService.fetchByGenreId(id);
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  Future<Either<Failure, T>> performApiCall<T>(Function apiFunction) async {
    try {
      final T list = await apiFunction();
      return right(list);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }
}
