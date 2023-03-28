import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../core/constants/constants.dart';
import '../../../core/errors/http_error_handler.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/entities/movie_list.dart';
import '../../domain/services/movies_api_service.dart';

@LazySingleton(as: MoviesApiService)
class MoviesApiServiceImpl extends MoviesApiService {
  @override
  Future<MovieList> searchMovies(String query, {int page = 1}) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: '3/search/movie',
      queryParameters: {
        'api_key': apiKey,
        'query': query,
        'page': page.toString(),
      },
    );

    try {
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
    final Uri uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: '3/discover/movie',
      queryParameters: {'api_key': apiKey, 'sort_by': 'popularity.desc'},
    );

    try {
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
