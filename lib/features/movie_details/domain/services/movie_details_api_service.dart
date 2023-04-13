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
  Future<MovieImageList> fetchMovieImages(int movieId, bool isTvShow);
  Future<VideoList> fetchVideos(int movieId, bool isTvShow);
  Future<Credits> fetchCredits(int movieId, bool isTvShow);
  Future<MovieList> fetchRecommendations(int movieId, bool isTvShow);
  Future<TvShowDetails> fetchTvShowDetails(int showId);
}
