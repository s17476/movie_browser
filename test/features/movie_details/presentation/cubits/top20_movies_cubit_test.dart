import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/top20_movies/top20_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

class MockTop20MovieListCubit extends Mock implements Top20MovieListCubit {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;
  late MockTop20MovieListCubit mockTop20MovieListCubit;

  late StreamController<Top20MovieListState> streamController;

  late Top20MoviesCubit cubit;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();

    mockTop20MovieListCubit = MockTop20MovieListCubit();
    streamController = StreamController<Top20MovieListState>();
    when(() => mockTop20MovieListCubit.stream).thenAnswer(
      (_) => streamController.stream,
    );

    cubit = Top20MoviesCubit(
      mockTop20MovieListCubit,
      mockMovieDetailsRepository,
    );
  });

  const tMovie = Movie(
    title: 'title',
    voteAverage: 5,
    id: 123,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    overview: 'overview',
  );

  const movieDetails = MovieDetails(
    id: 123,
    adult: false,
    budget: 100,
    genres: [],
    overview: '',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    revenue: 100,
    runtime: 100,
    tagline: 'tagline',
    title: 'title',
    voteAverage: 5,
    voteCount: 100,
  );

  const movies = [tMovie, tMovie, tMovie];

  group('Top20MoviesCubit', () {
    test(
      'should emit Top20MoviesState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const Top20MoviesState.initial());
      },
    );

    group('fetchTop20()', () {
      blocTest(
        'should emit error state',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .thenAnswer(
          (_) async => left(
            const Failure.general(message: ''),
          ),
        ),
        act: (cubit) async => await cubit.fetchTop20(movies),
        verify: (_) =>
            verify(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .called(
          movies.length,
        ),
        expect: () => [const Top20MoviesState.error()],
      );

      blocTest(
        'should emit loaded state',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .thenAnswer(
          (_) async => right(movieDetails),
        ),
        act: (cubit) async => await cubit.fetchTop20(movies),
        verify: (_) =>
            verify(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .called(
          movies.length,
        ),
        expect: () => [
          const Top20MoviesState.loaded(
            movies: [movieDetails, movieDetails, movieDetails],
          )
        ],
      );
    });

    group('stream subscription', () {
      blocTest(
        'should not emit new state',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .thenAnswer(
          (_) async => left(
            const Failure.general(message: ''),
          ),
        ),
        act: (_) => streamController.add(const Top20MovieListState.loading()),
        verify: (_) => verifyNever(
          () => mockMovieDetailsRepository.fetchMovieDetails(any()),
        ),
        expect: () => [],
      );

      blocTest(
        'should emit loaded state',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .thenAnswer(
          (_) async => right(movieDetails),
        ),
        act: (cubit) => streamController.add(
          const Top20MovieListState.loaded(
            movieList: MovieList(
              page: 0,
              totalPages: 100,
              totalResults: 1000,
              results: movies,
            ),
          ),
        ),
        verify: (_) =>
            verify(() => mockMovieDetailsRepository.fetchMovieDetails(any()))
                .called(
          movies.length,
        ),
        expect: () => [
          const Top20MoviesState.loaded(
            movies: [movieDetails, movieDetails, movieDetails],
          )
        ],
      );
    });
  });
}
