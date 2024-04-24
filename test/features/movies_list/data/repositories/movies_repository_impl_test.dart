import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/movies_list/data/repositories/movies_repository_impl.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show_list.dart';
import 'package:movie_browser/features/movies_list/domain/services/movies_api_service.dart';

class MockMoviesApiService extends Mock implements MoviesApiService {}

void main() {
  late MockMoviesApiService mockMoviesApiService;

  late MoviesRepositoryImpl repository;

  setUp(() {
    mockMoviesApiService = MockMoviesApiService();

    repository = MoviesRepositoryImpl(apiService: mockMoviesApiService);
  });

  const tMovie = Movie(
    title: 'title',
    voteAverage: 5,
    id: 0,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    overview: 'overview',
  );

  const tMovieList = MovieList(
    page: 1,
    totalPages: 100,
    totalResults: 1000,
    results: [tMovie],
  );

  const tTvShow = TvShow(
    name: 'name',
    voteAverage: 5,
    id: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    overview: 'overview',
  );

  const tTvShowList = TvShowList(
    page: 1,
    totalPages: 100,
    totalResults: 1000,
    results: [tTvShow],
  );

  const tQuery = 'query';
  const tPage = 1;

  group('MoviesRepositoryImpl', () {
    group('searchMovies()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.searchMovies(any())).thenThrow(
            MovieException(),
          );

          // act
          final result = await repository.searchMovies(tQuery);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.searchMovies(any())).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.searchMovies(tQuery);

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockMoviesApiService.searchMovies(any())).thenAnswer(
            (_) async => tMovieList,
          );

          // act
          final result = await repository.searchMovies(tQuery);

          // assert
          expect(result, right(tMovieList));
        },
      );
    });

    group('loadNextPage()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.loadNextResultsPage(any(), any()))
              .thenThrow(MovieException());

          // act
          final result = await repository.loadNextPage(tQuery, tPage);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.loadNextResultsPage(any(), any()))
              .thenThrow(
            Exception(),
          );

          // act
          final result = await repository.loadNextPage(tQuery, tPage);

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockMoviesApiService.loadNextResultsPage(any(), any()))
              .thenAnswer(
            (_) async => tMovieList,
          );

          // act
          final result = await repository.loadNextPage(tQuery, tPage);

          // assert
          expect(result, right(tMovieList));
        },
      );
    });

    group('top20Movies()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20Movies())
              .thenThrow(MovieException());

          // act
          final result = await repository.top20Movies();

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20Movies()).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.top20Movies();

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20Movies()).thenAnswer(
            (_) async => tMovieList,
          );

          // act
          final result = await repository.top20Movies();

          // assert
          expect(result, right(tMovieList));
        },
      );
    });

    group('top20TvShows()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20TvShows())
              .thenThrow(MovieException());

          // act
          final result = await repository.top20TvShows();

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20TvShows()).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.top20TvShows();

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return TvShowList',
        () async {
          // arrange
          when(() => mockMoviesApiService.top20TvShows()).thenAnswer(
            (_) async => tTvShowList,
          );

          // act
          final result = await repository.top20TvShows();

          // assert
          expect(result, right(tTvShowList));
        },
      );
    });

    group('fetchByGenreId()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchByGenreId(any()))
              .thenThrow(MovieException());

          // act
          final result = await repository.fetchByGenreId(0);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchByGenreId(any())).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.fetchByGenreId(0);

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchByGenreId(any())).thenAnswer(
            (_) async => tMovieList,
          );

          // act
          final result = await repository.fetchByGenreId(0);

          // assert
          expect(result, right(tMovieList));
        },
      );
    });

    group('fetchNextPageByGenreId()', () {
      test(
        'should return Failure.general - MovieException',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchNextPageByGenreId(any(), any()))
              .thenThrow(MovieException());

          // act
          final result = await repository.fetchNextPageByGenreId(tPage, 0);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                message: 'Movie Exception: Something went wrong',
              ),
            ),
          );
        },
      );

      test(
        'should return Failure.general - Exception',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchNextPageByGenreId(any(), any()))
              .thenThrow(
            Exception(),
          );

          // act
          final result = await repository.fetchNextPageByGenreId(tPage, 0);

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return MovieList',
        () async {
          // arrange
          when(() => mockMoviesApiService.fetchNextPageByGenreId(any(), any()))
              .thenAnswer(
            (_) async => tMovieList,
          );

          // act
          final result = await repository.fetchNextPageByGenreId(tPage, 0);

          // assert
          expect(result, right(tMovieList));
        },
      );
    });
  });
}
