import 'package:dartz/dartz.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_image_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieGenreList>> fetchMovieGenres();
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId);
  Future<Either<Failure, MovieImageList>> fetchMovieImages(
    int movieId,
    bool isTvShow,
  );
  Future<Either<Failure, VideoList>> fetchVideos(int movieId, bool isTvShow);
  Future<Either<Failure, Credits>> fetchCredits(int movieId, bool isTvShow);
  Future<Either<Failure, List<WatchProvider>>> fetchWatchProviders(
    int movieId,
    bool isTvShow,
  );
  Future<Either<Failure, MovieList>> fetchRecommendations(
    int movieId,
    bool isTvShow,
  );
  Future<Either<Failure, TvShowDetails>> fetchTvShowDetails(int showId);
}
