import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_image_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';

abstract class MovieDetailsApiService {
  Future<MovieGenreList> fetchMovieGenres();
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<MovieImageList> fetchMovieImages(int movieId, bool isTvShow);
  Future<VideoList> fetchVideos(int movieId, bool isTvShow);
  Future<Credits> fetchCredits(int movieId, bool isTvShow);
  Future<List<WatchProvider>> fetchWatchProviders(int movieId, bool isTvShow);
  Future<MovieList> fetchRecommendations(int movieId, bool isTvShow);
  Future<TvShowDetails> fetchTvShowDetails(int showId);
}
