import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show_list.dart';

abstract class MoviesApiService {
  Future<MovieList> top20Movies();
  Future<TvShowList> top20TvShows();
  Future<MovieList> searchMovies(String query, {int page = 1});
  Future<MovieList> loadNextResultsPage(String query, int page);
  Future<MovieList> fetchByGenreId(int id, {int page = 1});
  Future<MovieList> fetchNextPageByGenreId(int id, int page);
}
