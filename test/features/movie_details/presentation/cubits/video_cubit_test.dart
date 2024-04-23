import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/video/video_cubit.dart';

class MockMovieDetailsRepository extends Mock
    implements MovieDetailsRepository {}

class MockMovieDetailsCubit extends Mock implements MovieDetailsCubit {}

class MockTvShowDetailsCubit extends Mock implements TvShowDetailsCubit {}

class MockMovieDetails extends Mock implements MovieDetails {}

class MockTvShow extends Mock implements TvShowDetails {}

void main() {
  late MockMovieDetailsRepository mockMovieDetailsRepository;
  late MockMovieDetailsCubit mockMovieDetailsCubit;
  late MockTvShowDetailsCubit mockTvShowDetailsCubit;

  late StreamController<MovieDetailsState> movieDetailsStreamController;
  late StreamController<TvShowDetailsState> tvShowDetailsStreamController;

  late VideoCubit cubit;

  late MockMovieDetails mockMovieDetails;
  late MockTvShow mockTvShow;

  const tMovieId = 0;

  setUp(() {
    mockMovieDetailsRepository = MockMovieDetailsRepository();

    movieDetailsStreamController = StreamController<MovieDetailsState>();
    mockMovieDetailsCubit = MockMovieDetailsCubit();
    when(() => mockMovieDetailsCubit.stream).thenAnswer(
      (_) => movieDetailsStreamController.stream,
    );

    tvShowDetailsStreamController = StreamController<TvShowDetailsState>();
    mockTvShowDetailsCubit = MockTvShowDetailsCubit();
    when(() => mockTvShowDetailsCubit.stream).thenAnswer(
      (_) => tvShowDetailsStreamController.stream,
    );

    cubit = VideoCubit(
      mockMovieDetailsRepository,
      mockMovieDetailsCubit,
      mockTvShowDetailsCubit,
    );

    mockMovieDetails = MockMovieDetails();

    mockTvShow = MockTvShow();
  });

  const videos = VideoList(id: 123, results: []);

  group('VideoCubit', () {
    test(
      'should emit VideoState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const VideoState.initial());
      },
    );

    group('fetchVideos()', () {
      blocTest(
        'should emit [loading, error] states - movie',
        build: () => cubit,
        setUp: () => when(
          () => mockMovieDetailsRepository.fetchVideos(any(), any()),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.fetchVideos(tMovieId, false),
        expect: () => [
          const VideoState.loading(),
          const VideoState.error(),
        ],
      );

      blocTest(
        'should emit [loading, error] states - tvShow',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchVideos(any(), any()))
                .thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.fetchVideos(tMovieId, true),
        expect: () => [
          const VideoState.loading(),
          const VideoState.error(),
        ],
      );

      blocTest(
        'should emit [loading, loaded] states - movie',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchVideos(any(), any()))
                .thenAnswer(
          (_) async => right(videos),
        ),
        act: (cubit) => cubit.fetchVideos(tMovieId, false),
        expect: () => [
          const VideoState.loading(),
          const VideoState.loaded(videos: videos),
        ],
      );

      blocTest(
        'should emit [loading, loaded] states - tvShow',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchVideos(any(), any()))
                .thenAnswer(
          (_) async => right(videos),
        ),
        act: (cubit) => cubit.fetchVideos(tMovieId, true),
        expect: () => [
          const VideoState.loading(),
          const VideoState.loaded(videos: videos),
        ],
      );
    });

    group('MovieDetailsCubit listener', () {
      blocTest(
        'should not emin new state',
        build: () => cubit,
        act: (cubit) => movieDetailsStreamController.add(
          const MovieDetailsState.loading(),
        ),
        verify: (cubit) => verifyZeroInteractions(mockMovieDetailsRepository),
        expect: () => [],
      );

      blocTest(
        'should emit [loading, loaded] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchVideos(any(), false))
                .thenAnswer(
          (_) async => right(videos),
        ),
        act: (cubit) => movieDetailsStreamController.add(
          MovieDetailsState.loaded(id: tMovieId, movie: mockMovieDetails),
        ),
        verify: (cubit) => verify(
          () => mockMovieDetailsRepository.fetchVideos(tMovieId, false),
        ),
        expect: () => [
          const VideoState.loading(),
          const VideoState.loaded(videos: videos),
        ],
      );
    });

    group('TvShowDetailsCubit listener', () {
      blocTest(
        'should not emin new state',
        build: () => cubit,
        act: (cubit) => tvShowDetailsStreamController.add(
          const TvShowDetailsState.loading(),
        ),
        verify: (cubit) => verifyZeroInteractions(mockMovieDetailsRepository),
        expect: () => [],
      );

      blocTest(
        'should emit [loading, loaded] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockMovieDetailsRepository.fetchVideos(any(), true))
                .thenAnswer(
          (_) async => right(videos),
        ),
        act: (cubit) => tvShowDetailsStreamController.add(
          TvShowDetailsState.loaded(id: tMovieId, tvShow: mockTvShow),
        ),
        verify: (cubit) => verify(
          () => mockMovieDetailsRepository.fetchVideos(tMovieId, true),
        ),
        expect: () => [
          const VideoState.loading(),
          const VideoState.loaded(videos: videos),
        ],
      );
    });
  });
}
