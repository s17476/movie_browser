import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../../core/errors/movie_exception.dart';
import '../../../movies_list/domain/entities/movie_list.dart';
import '../../domain/entities/credits.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/movie_genre_list.dart';
import '../../domain/entities/movie_image_list.dart';
import '../../domain/entities/tv_show_details.dart';
import '../../domain/entities/video_list.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../../domain/services/movie_details_api_service.dart';

@LazySingleton(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsApiService apiService;

  MovieDetailsRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, MovieGenreList>> fetchMovieGenres() async {
    try {
      final MovieGenreList genres = await apiService.fetchMovieGenres();
      return right(genres);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId) async {
    try {
      final MovieDetails movie = await apiService.fetchMovieDetails(movieId);
      return right(movie);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, MovieImageList>> fetchMovieImages(
    int movieId,
    bool isTvShow,
  ) async {
    try {
      final MovieImageList images =
          await apiService.fetchMovieImages(movieId, isTvShow);
      return right(images);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, VideoList>> fetchVideos(
    int movieId,
    bool isTvShow,
  ) async {
    try {
      final VideoList videos = await apiService.fetchVideos(movieId, isTvShow);
      return right(videos);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, Credits>> fetchCredits(
    int movieId,
    bool isTvShow,
  ) async {
    try {
      final Credits credits = await apiService.fetchCredits(movieId, isTvShow);
      return right(credits);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, MovieList>> fetchRecommendations(
    int movieId,
    bool isTvShow,
  ) async {
    try {
      final MovieList movieList =
          await apiService.fetchRecommendations(movieId, isTvShow);
      return right(movieList);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }

  @override
  Future<Either<Failure, TvShowDetails>> fetchTvShowDetails(int showId) async {
    try {
      final TvShowDetails show = await apiService.fetchTvShowDetails(showId);
      return right(show);
    } on MovieException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(const Failure());
    }
  }
}
