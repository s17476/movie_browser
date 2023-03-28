import '../entities/movie_details.dart';

abstract class MovieDetailsApiService {
  Future<MovieDetails> fetchMoviedetails(int movieId);
}
