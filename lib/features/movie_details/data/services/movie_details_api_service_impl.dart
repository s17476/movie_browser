import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';

import '../../../core/constants/constants.dart';
import '../../../core/errors/http_error_handler.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/services/movie_details_api_service.dart';

@LazySingleton(as: MovieDetailsApiService)
class MovieDetailsApiServiceImpl extends MovieDetailsApiService {
  @override
  Future<MovieDetails> fetchMovieDetails(int movieId) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kBaseUrl,
      path: '3/movie/$movieId',
      queryParameters: {
        'api_key': kApiKey,
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final movieDetails = MovieDetails.fromJson(json);

      if (movieDetails.title.isEmpty) {
        throw MovieException('Movie not found.');
      }

      return movieDetails;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieGenreList> fetchMovieGenres() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kBaseUrl,
      path: '3/genre/movie/list',
      queryParameters: {
        'api_key': kApiKey,
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final json = jsonDecode(response.body);
      final genres = MovieGenreList.fromJson(json);

      if (genres.genres.isEmpty) {
        throw MovieException('No genres found.');
      }

      return genres;
    } catch (e) {
      rethrow;
    }
  }
}
