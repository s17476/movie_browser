import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;

  late TvShowDetailsCubit cubit;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();

    cubit = TvShowDetailsCubit(mockMovieDetailsRepository);
  });

  const tTvShow = TvShowDetails(
    id: 123,
    name: 'name',
    overview: 'overview',
    firstAirDate: 'firstAirDate',
    genres: [],
    numberOfSeasons: 10,
    numberOfEpisodes: 100,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    voteAverage: 5,
    voteCount: 50,
  );

  group('TvShowDetailsCubit', () {
    test(
      'should emit TvShowDetailsState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const TvShowDetailsState.initial());
      },
    );

    group('fetchTvShowDetails()', () {
      blocTest(
        'should emit [loading, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockMovieDetailsRepository.fetchTvShowDetails(any()),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.fetchTvShowDetails(123),
        expect: () => [
          const TvShowDetailsState.loading(),
          const TvShowDetailsState.error(),
        ],
      );

      blocTest(
        'should emit [loading, loaded] states',
        build: () => cubit,
        setUp: () => when(
          () => mockMovieDetailsRepository.fetchTvShowDetails(any()),
        ).thenAnswer(
          (_) async => right(tTvShow),
        ),
        act: (cubit) => cubit.fetchTvShowDetails(123),
        expect: () => [
          const TvShowDetailsState.loading(),
          const TvShowDetailsState.loaded(id: 123, tvShow: tTvShow),
        ],
      );
    });
  });
}
