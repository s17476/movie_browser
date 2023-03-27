import 'package:injectable/injectable.dart';

import '../entities/movie_list.dart';

@injectable
abstract class MoviesApiService {
  Future<MovieList> searchMovies(String query, {int page = 1});
  Future<MovieList> loadNextResultsPage(
    String query,
    int page,
  );
  Future<MovieList> top20Movies();
}
