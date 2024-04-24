import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show_list.dart';
import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';
import 'package:movie_browser/features/movies_list/domain/services/movies_api_service.dart';

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
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieList>> loadNextPage(
      String query, int page) async {
    try {
      final MovieList movieList = await apiService.loadNextResultsPage(
        query,
        page,
      );

      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieList>> top20Movies() async {
    return _performApiCall(apiService.top20Movies);
  }

  @override
  Future<Either<Failure, TvShowList>> top20TvShows() async {
    return _performApiCall(apiService.top20TvShows);
  }

  @override
  Future<Either<Failure, MovieList>> fetchByGenreId(int id) async {
    try {
      final MovieList movieList = await apiService.fetchByGenreId(id);
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieList>> fetchNextPageByGenreId(
      int id, int page) async {
    try {
      final MovieList movieList = await apiService.fetchNextPageByGenreId(
        id,
        page,
      );

      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  Future<Either<Failure, T>> _performApiCall<T>(Function apiFunction) async {
    try {
      final T list = await apiFunction();
      return right(list);
    } on MovieException catch (e) {
      return left(Failure.general(message: e.message));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }
}
