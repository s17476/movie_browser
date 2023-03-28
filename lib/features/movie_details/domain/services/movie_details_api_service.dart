import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';

import '../entities/movie_details.dart';

abstract class MovieDetailsApiService {
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<MovieGenreList> fetchMovieGenres();
}
