import '../../../movies_list/domain/entities/movie_list.dart';
import '../entities/credits.dart';
import '../entities/movie_details.dart';
import '../entities/movie_genre_list.dart';
import '../entities/movie_image_list.dart';
import '../entities/tv_show_details.dart';
import '../entities/video_list.dart';

abstract class MovieDetailsApiService {
  Future<MovieGenreList> fetchMovieGenres();
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<MovieImageList> fetchMovieImages(int movieId);
  Future<VideoList> fetchVideos(int movieId);
  Future<Credits> fetchCredits(int movieId);
  Future<MovieList> fetchRecommendations(int movieId);
  Future<TvShowDetails> fetchTvShowDetails(int showId);
  Future<MovieImageList> fetchTvShowImages(int showId);
  Future<VideoList> fetchTvShowVideos(int showId);
  Future<Credits> fetchTvShowCredits(int showId);
  Future<MovieList> fetchTvShowRecommendations(int showId);
}
