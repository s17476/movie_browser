import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../core/constants/constants.dart';
import '../../../core/errors/http_error_handler.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/movie_list.dart';
import '../../domain/entities/tv_show_list.dart';
import '../../domain/services/movies_api_service.dart';

@LazySingleton(as: MoviesApiService)
class MoviesApiServiceImpl extends MoviesApiService {
  @override
  Future<MovieList> searchMovies(String query, {int page = 1}) async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/search/movie',
        queryParameters: {
          'api_key': kApiKey,
          'query': query,
          'page': page.toString(),
        },
      );

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final movieList = MovieList.fromJson(json);

      if (movieList.results.isEmpty) {
        throw MovieException('No movies matching \'$query\' found.');
      }

      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieList> loadNextResultsPage(String query, int page) =>
      searchMovies(query, page: page);

  @override
  Future<MovieList> top20Movies() async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/discover/movie',
        queryParameters: {'api_key': kApiKey, 'sort_by': 'popularity.desc'},
      );

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final json = jsonDecode(response.body);
      final movieList = MovieList.fromJson(json);

      if (movieList.results.isEmpty) {
        throw MovieException('No movies found.');
      }

      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TvShowList> top20TvShows() async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/discover/tv',
        queryParameters: {
          'api_key': kApiKey,
          'sort_by': 'popularity.desc',
          'with_original_language': 'en',
        },
      );

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final json = jsonDecode(response.body);
      final movieList = TvShowList.fromJson(json);

      if (movieList.results.isEmpty) {
        throw MovieException('No movies found.');
      }

      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieList> fetchByGenreId(int id) async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/discover/movie',
        queryParameters: {
          'api_key': kApiKey,
          'sort_by': 'popularity.desc',
          'with_original_language': 'en',
          'with_genres': id.toString(),
        },
      );

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final json = jsonDecode(response.body);
      final movieList = MovieList.fromJson(json);

      if (movieList.results.isEmpty) {
        throw MovieException('No movies found.');
      }

      return movieList;
    } catch (e) {
      rethrow;
    }
  }
}
