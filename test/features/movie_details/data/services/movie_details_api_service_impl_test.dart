import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/movie_details/data/services/movie_details_api_service_impl.dart';
import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_image_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  late MovieDetailsApiServiceImpl service;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();

    service = MovieDetailsApiServiceImpl(client: mockHttpClient);
  });

  group('MovieDetailsApiServiceImpl', () {
    group('fetchMovieGenres()', () {
      const tEmptyGenres = MovieGenreList(genres: []);
      const tGenres = MovieGenreList(genres: [MovieGenre(id: 0, name: 'name')]);

      test(
        'should throw an Exception',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchMovieGenres;

          // assert
          expect(() => call(), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchMovieGenres;

          // assert
          expect(() => call(), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw a MovieException',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tEmptyGenres.toJson()), 200),
          );

          // act
          final call = service.fetchMovieGenres;

          // assert
          expect(() => call(), throwsA(const TypeMatcher<MovieException>()));
        },
      );

      test(
        'should return MovieGenreList',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tGenres.toJson()), 200),
          );

          // act
          final result = await service.fetchMovieGenres();

          // assert
          expect(result, tGenres);
        },
      );
    });

    group('fetchMovieDetails()', () {
      const tMovieDetails = MovieDetails(
        id: 1,
        adult: true,
        budget: 100,
        genres: [],
        overview: 'overview',
        posterPath: 'posterPath',
        releaseDate: 'releaseDate',
        revenue: 0,
        runtime: 100,
        tagline: 'tagline',
        title: 'title',
        voteAverage: 1,
        voteCount: 100,
      );

      test(
        'should throw an Exception',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchMovieDetails;

          // assert
          expect(
            () => call(tMovieDetails.id),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchMovieDetails;

          // assert
          expect(() => call(tMovieDetails.id),
              throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw a MovieException',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(
              jsonEncode(tMovieDetails.copyWith(title: '').toJson()),
              200,
            ),
          );

          // act
          final call = service.fetchMovieDetails;

          // assert
          expect(() => call(tMovieDetails.id),
              throwsA(const TypeMatcher<MovieException>()));
        },
      );

      test(
        'should return MovieDetails',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tMovieDetails.toJson()), 200),
          );

          // act
          final result = await service.fetchMovieDetails(tMovieDetails.id);

          // assert
          expect(result, tMovieDetails);
        },
      );
    });

    group('fetchMovieImages()', () {
      const tMovieImageList = MovieImageList(id: 0, backdrops: [], posters: []);

      test(
        'should throw an Exception - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchMovieImages;

          // assert
          expect(
            () => call(0, false),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchMovieImages;

          // assert
          expect(
            () => call(0, true),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200 - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchMovieImages;

          // assert
          expect(() => call(0, false), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200 - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchMovieImages;

          // assert
          expect(() => call(0, true), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should return MovieImageList - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async =>
                http.Response(jsonEncode(tMovieImageList.toJson()), 200),
          );

          // act
          final result = await service.fetchMovieImages(0, false);

          // assert
          expect(result, tMovieImageList);
        },
      );

      test(
        'should return MovieImageList - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async =>
                http.Response(jsonEncode(tMovieImageList.toJson()), 200),
          );

          // act
          final result = await service.fetchMovieImages(0, true);

          // assert
          expect(result, tMovieImageList);
        },
      );
    });

    group('fetchVideos()', () {
      const tVideoList = VideoList(id: 0, results: []);

      test(
        'should throw an Exception - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchVideos;

          // assert
          expect(
            () => call(0, false),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchVideos;

          // assert
          expect(
            () => call(0, true),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200 - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchVideos;

          // assert
          expect(() => call(0, false), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200 - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchVideos;

          // assert
          expect(() => call(0, true), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should return VideoList - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tVideoList.toJson()), 200),
          );

          // act
          final result = await service.fetchVideos(0, false);

          // assert
          expect(result, tVideoList);
        },
      );

      test(
        'should return VideoList - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tVideoList.toJson()), 200),
          );

          // act
          final result = await service.fetchVideos(0, true);

          // assert
          expect(result, tVideoList);
        },
      );
    });

    group('fetchCredits()', () {
      const tCredits = Credits(id: 0, cast: []);

      test(
        'should throw an Exception - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchCredits;

          // assert
          expect(
            () => call(0, false),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchCredits;

          // assert
          expect(
            () => call(0, true),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200 - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchCredits;

          // assert
          expect(() => call(0, false), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200 - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchCredits;

          // assert
          expect(() => call(0, true), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should return Credits - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tCredits.toJson()), 200),
          );

          // act
          final result = await service.fetchCredits(0, false);

          // assert
          expect(result, tCredits);
        },
      );

      test(
        'should return Credits - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tCredits.toJson()), 200),
          );

          // act
          final result = await service.fetchCredits(0, true);

          // assert
          expect(result, tCredits);
        },
      );
    });

    group('fetchWatchProviders()', () {
      const tWatchProviders = [
        WatchProvider(
          providerId: 0,
          displayPriority: 1,
          providerName: 'providerName',
          logoPath: 'logoPath',
          providerType: ProviderType.flatrate,
        )
      ];

      const tMap = {
        'results': {
          'US': {'flatrate': tWatchProviders}
        }
      };

      test(
        'should throw an Exception - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchWatchProviders;

          // assert
          expect(
            () => call(0, false),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchWatchProviders;

          // assert
          expect(
            () => call(0, true),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200 - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchWatchProviders;

          // assert
          expect(() => call(0, false), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200 - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchWatchProviders;

          // assert
          expect(() => call(0, true), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should return List<WatchProvider> - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(
              jsonEncode(tMap),
              200,
            ),
          );

          // act
          final result = await service.fetchWatchProviders(0, false);

          // assert
          expect(result, tWatchProviders);
        },
      );

      test(
        'should return List<WatchProvider> - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(
              jsonEncode(tMap),
              200,
            ),
          );

          // act
          final result = await service.fetchWatchProviders(0, true);

          // assert
          expect(result, tWatchProviders);
        },
      );
    });

    group('fetchRecommendations()', () {
      const tMovieList = MovieList(
        page: 0,
        totalPages: 100,
        totalResults: 1000,
        results: [],
      );

      test(
        'should throw an Exception - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchRecommendations;

          // assert
          expect(
            () => call(0, false),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchRecommendations;

          // assert
          expect(
            () => call(0, true),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200 - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchRecommendations;

          // assert
          expect(() => call(0, false), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw an Exception - response code != 200 - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchRecommendations;

          // assert
          expect(() => call(0, true), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should return MovieList - movie',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tMovieList.toJson()), 200),
          );

          // act
          final result = await service.fetchRecommendations(0, false);

          // assert
          expect(result, tMovieList);
        },
      );

      test(
        'should return MovieList - tvShow',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tMovieList.toJson()), 200),
          );

          // act
          final result = await service.fetchRecommendations(0, true);

          // assert
          expect(result, tMovieList);
        },
      );
    });

    group('fetchTvShowDetails()', () {
      const tTvShowDetails = TvShowDetails(
        id: 1,
        genres: [],
        overview: 'overview',
        posterPath: 'posterPath',
        name: 'name',
        firstAirDate: '',
        numberOfSeasons: 10,
        numberOfEpisodes: 100,
        status: 'status',
        tagline: 'tagline',
        voteAverage: 1,
        voteCount: 100,
      );

      test(
        'should throw an Exception',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.fetchTvShowDetails;

          // assert
          expect(
            () => call(tTvShowDetails.id),
            throwsA(const TypeMatcher<Exception>()),
          );
        },
      );

      test(
        'should throw an Exception - response code != 200',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response('', 404),
          );

          // act
          final call = service.fetchTvShowDetails;

          // assert
          expect(() => call(tTvShowDetails.id),
              throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw a MovieException',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(
              jsonEncode(tTvShowDetails.copyWith(name: '').toJson()),
              200,
            ),
          );

          // act
          final call = service.fetchTvShowDetails;

          // assert
          expect(() => call(tTvShowDetails.id),
              throwsA(const TypeMatcher<MovieException>()));
        },
      );

      test(
        'should return TvShowDetails',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async =>
                http.Response(jsonEncode(tTvShowDetails.toJson()), 200),
          );

          // act
          final result = await service.fetchTvShowDetails(tTvShowDetails.id);

          // assert
          expect(result, tTvShowDetails);
        },
      );
    });
  });
}
