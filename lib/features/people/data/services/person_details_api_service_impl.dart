import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:movie_browser/secrets.dart';
import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/errors/http_error_handler.dart';
import 'package:movie_browser/features/people/domain/entities/person_credits.dart';
import 'package:movie_browser/features/people/domain/entities/person_details.dart';
import 'package:movie_browser/features/people/domain/services/person_details_api_service.dart';

@LazySingleton(as: PersonDetailsApiService)
class PersonDetailsApiServiceImpl extends PersonDetailsApiService {
  final http.Client client;

  PersonDetailsApiServiceImpl({
    required this.client,
  });

  @override
  Future<PersonDetails> fetchPersonDetails(int personId) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kBaseUrl,
      path: '3/person/$personId',
      queryParameters: {
        'api_key': kApiKey,
      },
    );

    try {
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final personDetails = PersonDetails.fromJson(json);

      return personDetails;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PersonCredits> fetchPersonCredits(int personId) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kBaseUrl,
      path: '3/person/$personId/movie_credits',
      queryParameters: {
        'api_key': kApiKey,
      },
    );

    try {
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final personCredits = PersonCredits.fromJson(json);

      return personCredits;
    } catch (e) {
      rethrow;
    }
  }
}
