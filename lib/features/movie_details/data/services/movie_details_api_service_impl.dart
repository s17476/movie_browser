import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/errors/http_error_handler.dart';
import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/core/utils/logger.dart';
import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_image_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movie_details/domain/services/movie_details_api_service.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/secrets.dart';

@LazySingleton(as: MovieDetailsApiService)
class MovieDetailsApiServiceImpl extends MovieDetailsApiService {
  final http.Client client;

  MovieDetailsApiServiceImpl({
    required this.client,
  });

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
      final response = await client.get(uri);

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
      final response = await client.get(uri);

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
  Future<MovieImageList> fetchMovieImages(int movieId, bool isTvShow) async {
    try {
      final endpoint = isTvShow ? 'tv' : 'movie';
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/$endpoint/$movieId/images',
        queryParameters: {
          'api_key': kApiKey,
        },
      );
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final images = MovieImageList.fromJson(json);

      return images;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VideoList> fetchVideos(int movieId, bool isTvShow) async {
    try {
      final endpoint = isTvShow ? 'tv' : 'movie';
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/$endpoint/$movieId/videos',
        queryParameters: {
          'api_key': kApiKey,
        },
      );
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final videos = VideoList.fromJson(json);

      return videos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Credits> fetchCredits(int movieId, bool isTvShow) async {
    try {
      final endpoint = isTvShow ? 'tv' : 'movie';
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/$endpoint/$movieId/credits',
        queryParameters: {
          'api_key': kApiKey,
        },
      );
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final credits = Credits.fromJson(json);

      return credits;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WatchProvider>> fetchWatchProviders(
      int movieId, bool isTvShow) async {
    try {
      final endpoint = isTvShow ? 'tv' : 'movie';
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/$endpoint/$movieId/watch/providers',
        queryParameters: {
          'api_key': kApiKey,
        },
      );
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final watchProviders = await compute(_parseWatchProviders, response.body);

      return watchProviders;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<WatchProvider>> _parseWatchProviders(String body) async {
    List<WatchProvider> watchProviders = [];
    final json = jsonDecode(body) as Map<String, dynamic>;

    for (var providerType in ProviderType.values) {
      final buyProviders = json['results']['US'] // TODO - internationalisation
          ?[providerType.name];

      Log.f(buyProviders);

      if (buyProviders != null) {
        for (var provider in buyProviders as List<dynamic>) {
          final watchProvider = WatchProvider.fromJsonWithType(
            provider,
            providerType,
          );

          watchProviders.add(watchProvider);
        }
      }
    }

    return watchProviders;
  }

  @override
  Future<MovieList> fetchRecommendations(int movieId, bool isTvShow) async {
    final endpoint = isTvShow ? 'tv' : 'movie';
    try {
      final Uri uri = Uri(
        scheme: 'https',
        host: kBaseUrl,
        path: '3/$endpoint/$movieId/recommendations',
        queryParameters: {
          'api_key': kApiKey,
          'page': '1',
        },
      );

      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final json = jsonDecode(response.body);
      final movieList = MovieList.fromJson(json);

      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TvShowDetails> fetchTvShowDetails(int showId) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kBaseUrl,
      path: '3/tv/$showId',
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
      final showDetails = TvShowDetails.fromJson(json);

      if (showDetails.name.isEmpty) {
        throw MovieException('Movie not found.');
      }

      return showDetails;
    } catch (e) {
      rethrow;
    }
  }
}
