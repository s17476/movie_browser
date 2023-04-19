import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../../../secrets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/errors/http_error_handler.dart';
import '../../domain/services/profile_api_service.dart';

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
      // Get the rated movies for a guest session.
      // If a guest session is not used for the first time within 24 hours, it will be automatically deleted.
      uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/guest_session/$sessionId/rated/movies',
        queryParameters: {
          'api_key': kApiKey,
        },
      );

      response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

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
