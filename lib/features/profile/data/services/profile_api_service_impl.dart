import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import 'package:movie_browser/secrets.dart';
import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/errors/http_error_handler.dart';
import 'package:movie_browser/features/profile/domain/services/profile_api_service.dart';

@LazySingleton(as: ProfileApiService)
class ProfileApiServiceImpl extends ProfileApiService {
  final http.Client client;

  ProfileApiServiceImpl({
    required this.client,
  });

  @override
  Future<String> createGuestSession() async {
    try {
      Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/authentication/guest_session/new',
        queryParameters: {
          'api_key': kApiKey,
        },
      );

      Response response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final sessionId = json['guest_session_id'];

      // Prevent auto deletion.
      // If a guest session is not used for the first time within 60 minutes, it will be automatically deleted.
      uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/movie/24428/rating',
        queryParameters: {
          'api_key': kApiKey,
          'guest_session_id': sessionId,
        },
      );

      final body = {'value': '10'};

      response = await client.post(uri, body: body);

      if (response.statusCode != 201) {
        throw Exception(httpErrorHandler(response));
      }

      client.delete(uri);

      return sessionId;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> rateMovie(int movieId, String sessionId, int value) async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/movie/$movieId/rating',
        queryParameters: {
          'api_key': kApiKey,
          'guest_session_id': sessionId,
        },
      );

      final Map<String, dynamic> requestBody = {
        "value": value.toString(),
      };

      final Response response = await client.post(uri, body: requestBody);

      if (response.statusCode != 201) {
        throw Exception(httpErrorHandler(response));
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> rateTvShow(int showId, String sessionId, int value) async {
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/tv/$showId/rating',
        queryParameters: {
          'api_key': kApiKey,
          'guest_session_id': sessionId,
        },
      );

      final Map<String, dynamic> requestBody = {
        "value": value.toString(),
      };

      final Response response = await client.post(uri, body: requestBody);

      if (response.statusCode != 201) {
        throw Exception(httpErrorHandler(response));
      }
    } catch (e) {
      rethrow;
    }
  }
}
