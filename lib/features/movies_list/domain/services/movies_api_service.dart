import '../entities/movie_list.dart';
import '../entities/tv_show_list.dart';

abstract class MoviesApiService {
  Future<MovieList> searchMovies(String query, {int page = 1});
  Future<MovieList> loadNextResultsPage(
    String query,
    int page,
  );
  Future<MovieList> top20Movies();
  Future<TvShowList> top20TvShows();
  Future<MovieList> fetchByGenreId(int id);
}
