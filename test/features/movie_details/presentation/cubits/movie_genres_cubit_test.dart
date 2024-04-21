import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;

  late MovieGenresCubit cubit;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();
  });

  const tMovieGenres = MovieGenreList(
    genres: [MovieGenre(id: 0, name: 'name')],
  );

  group('MovieGenresCubit', () {
    group('constructor', () {
      test(
        'should emit error as an initial state',
        () async {
          // arrange
          when(() => mockMovieDetailsRepository.fetchMovieGenres()).thenAnswer(
            (_) async => left(const Failure.general(message: '')),
          );

          cubit = MovieGenresCubit(mockMovieDetailsRepository);

          await Future.delayed(Durations.short1);

          // assert
          expect(cubit.state, const MovieGenresState.error());
        },
      );

      test(
        'should emit loaded as an initial state',
        () async {
          // arrange
          when(() => mockMovieDetailsRepository.fetchMovieGenres()).thenAnswer(
            (_) async => right(tMovieGenres),
          );

          cubit = MovieGenresCubit(mockMovieDetailsRepository);

          await Future.delayed(Durations.short1);

          // assert
          expect(
            cubit.state,
            const MovieGenresState.loaded(genreList: tMovieGenres),
          );
        },
      );
    });
    group('fetchMovieGenres()', () {
      blocTest(
        'should emit [loading, error]',
        build: () => MovieGenresCubit(mockMovieDetailsRepository),
        setUp: () => when(() => mockMovieDetailsRepository.fetchMovieGenres())
            .thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) async => await Future.delayed(
          Durations.short1,
          cubit.fetchMovieGeneres,
        ),
        skip: 1,
        expect: () => [
          const MovieGenresState.loading(),
          const MovieGenresState.error(),
        ],
      );

      blocTest(
        'should emit [loading, loaded]',
        build: () => MovieGenresCubit(mockMovieDetailsRepository),
        setUp: () => when(() => mockMovieDetailsRepository.fetchMovieGenres())
            .thenAnswer(
          (_) async => right(tMovieGenres),
        ),
        act: (cubit) async => await Future.delayed(
          Durations.short1,
          cubit.fetchMovieGeneres,
        ),
        skip: 1,
        expect: () => [
          const MovieGenresState.loading(),
          const MovieGenresState.loaded(genreList: tMovieGenres),
        ],
      );
    });
  });
}
