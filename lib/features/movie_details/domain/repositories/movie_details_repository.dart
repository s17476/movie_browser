import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../movies_list/domain/entities/movie_list.dart';
import '../entities/credits.dart';
import '../entities/movie_details.dart';
import '../entities/movie_genre_list.dart';
import '../entities/movie_image_list.dart';
import '../entities/tv_show_details.dart';
import '../entities/video_list.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieGenreList>> fetchMovieGenres();
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId);
  Future<Either<Failure, MovieImageList>> fetchMovieImages(int movieId);
  Future<Either<Failure, VideoList>> fetchVideos(int movieId);
  Future<Either<Failure, Credits>> fetchCredits(int movieId);
  Future<Either<Failure, MovieList>> fetchRecommendations(int movieId);
  Future<Either<Failure, TvShowDetails>> fetchTvShowDetails(int showId);
  Future<Either<Failure, MovieImageList>> fetchTvShowImages(int showId);
  Future<Either<Failure, VideoList>> fetchTvShowVideos(int showId);
  Future<Either<Failure, Credits>> fetchTvShowCredits(int showId);
  Future<Either<Failure, MovieList>> fetchTvShowRecommendations(int showId);
}
