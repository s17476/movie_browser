import '../entities/credits.dart';
import '../entities/movie_details.dart';
import '../entities/movie_genre_list.dart';
import '../entities/movie_image_list.dart';
import '../entities/video_list.dart';

abstract class MovieDetailsApiService {
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<MovieImageList> fetchMovieImages(int movieId);
  Future<VideoList> fetchVideos(int movieId);
  Future<Credits> fetchCredits(int movieId);
  Future<MovieGenreList> fetchMovieGenres();
}
