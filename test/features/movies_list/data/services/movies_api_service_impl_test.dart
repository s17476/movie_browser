import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/movies_list/data/services/movies_api_service_impl.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/services/movies_api_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  late MoviesApiServiceImpl service;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();

    service = MoviesApiServiceImpl(client: mockHttpClient);
  });

  const tQuery = 'query';

  const tEmptyMovieList = MovieList(
    page: 0,
    totalPages: 100,
    totalResults: 1000,
    results: [],
  );

  const tMovie = Movie(
    title: 'title',
    voteAverage: 5,
    id: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    overview: 'overview',
  );

  const tMovieList = MovieList(
    page: 0,
    totalPages: 100,
    totalResults: 1000,
    results: [tMovie],
  );

  group('MoviesApiServiceImpl', () {
    group('searchMovies()', () {
      test(
        'should throw an Exception',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenThrow(Exception());

          // act
          final call = service.searchMovies;

          // assert
          expect(() => call(tQuery), throwsA(const TypeMatcher<Exception>()));
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
          final call = service.searchMovies;

          // assert
          expect(() => call(tQuery), throwsA(const TypeMatcher<Exception>()));
        },
      );

      test(
        'should throw a MovieException',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async =>
                http.Response(jsonEncode(tEmptyMovieList.toJson()), 200),
          );

          // act
          final call = service.searchMovies;

          // assert
          expect(
              () => call(tQuery), throwsA(const TypeMatcher<MovieException>()));
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockHttpClient.get(any())).thenAnswer(
            (_) async => http.Response(jsonEncode(tMovieList.toJson()), 200),
          );

          // act
          final result = await service.searchMovies(tQuery);

          // assert
          expect(result, tMovieList);
        },
      );
    });
  });
}
