import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';

import '../../../core/constants/constants.dart';
import '../../../core/errors/http_error_handler.dart';
import '../../../core/errors/movie_exception.dart';
import '../../domain/services/movie_details_api_service.dart';

@LazySingleton(as: MovieDetailsApiService)
class MovieDetailsApiServiceImpl extends MovieDetailsApiService {
  @override
  Future<MovieDetails> fetchMoviedetails(int movieId) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: '3/movie/$movieId',
      queryParameters: {
        'api_key': apiKey,
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
}