import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;

  late MovieDetailsCubit cubit;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();

    cubit = MovieDetailsCubit(mockMovieDetailsRepository);
  });

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

  group('MovieDetailsCubit', () {
    group('fetchMovieDetails()', () {
      blocTest(
        'should return [loading, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockMovieDetailsRepository.fetchMovieDetails(tMovieDetails.id),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.fetchMovieDetails(tMovieDetails.id),
        expect: () => [
          const MovieDetailsState.loading(),
          const MovieDetailsState.error(),
        ],
      );

      blocTest(
        'should return [loading, loaded] states',
        build: () => cubit,
        setUp: () => when(
          () => mockMovieDetailsRepository.fetchMovieDetails(tMovieDetails.id),
        ).thenAnswer(
          (_) async => right(tMovieDetails),
        ),
        act: (cubit) => cubit.fetchMovieDetails(tMovieDetails.id),
        expect: () => [
          const MovieDetailsState.loading(),
          MovieDetailsState.loaded(id: tMovieDetails.id, movie: tMovieDetails),
        ],
      );
    });
  });
}
