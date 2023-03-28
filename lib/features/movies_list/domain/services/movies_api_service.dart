import '../entities/movie_list.dart';

abstract class MoviesApiService {
  Future<MovieList> searchMovies(String query, {int page = 1});
  Future<MovieList> loadNextResultsPage(
    String query,
    int page,
  );
  Future<MovieList> top20Movies();
}
