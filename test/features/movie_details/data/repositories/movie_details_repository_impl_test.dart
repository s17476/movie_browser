import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/core/errors/failure.dart';
import 'package:movie_browser/features/core/errors/movie_exception.dart';
import 'package:movie_browser/features/movie_details/data/repositories/movie_details_repository_impl.dart';
import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_image_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/video_list.dart';
import 'package:movie_browser/features/movie_details/domain/entities/watch_provider.dart';
import 'package:movie_browser/features/movie_details/domain/services/movie_details_api_service.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';

class MockMovieDetailsApiService extends Mock
    implements MovieDetailsApiService {}

void main() {
  late MockMovieDetailsApiService mockMovieDetailsApiService;

  late MovieDetailsRepositoryImpl repository;

  setUp(() {
    mockMovieDetailsApiService = MockMovieDetailsApiService();

    repository = MovieDetailsRepositoryImpl(
      apiService: mockMovieDetailsApiService,
    );
  });

  group('MovieDetailsServiceImpl', () {
    group('fetchMovieGenres()', () {
      const tMovieGenre = MovieGenre(id: 1, name: 'name');
      const tMovieGenreList = MovieGenreList(genres: [tMovieGenre]);

      test(
        'should return Failure.general(\'Movie Exception: No genres found.\')',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieGenres()).thenThrow(
            MovieException('No genres found.'),
          );

          // act
          final result = await repository.fetchMovieGenres();

          // assert
          expect(
            result,
            left(
              const Failure.general(
                  message: 'Movie Exception: No genres found.'),
            ),
          );
        },
      );

      test(
        'should return Failure.general()',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieGenres()).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.fetchMovieGenres();

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return List<MovieGenre>',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieGenres()).thenAnswer(
            (_) async => tMovieGenreList,
          );

          // act
          final result = await repository.fetchMovieGenres();

          // assert
          expect(result, right(tMovieGenreList));
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
        'should return Failure.general(\'Movie Exception: Movie not found.\')',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieDetails(1)).thenThrow(
            MovieException('Movie not found.'),
          );

          // act
          final result = await repository.fetchMovieDetails(1);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                  message: 'Movie Exception: Movie not found.'),
            ),
          );
        },
      );

      test(
        'should return Failure.general()',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieDetails(1)).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.fetchMovieDetails(1);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return MovieDetails',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService
              .fetchMovieDetails(tMovieDetails.id)).thenAnswer(
            (_) async => tMovieDetails,
          );

          // act
          final result = await repository.fetchMovieDetails(tMovieDetails.id);

          // assert
          expect(result, right(tMovieDetails));
        },
      );
    });

    group('fetchMovieImages()', () {
      const tId = 1;
      const tMovieImagesList = MovieImageList(
        id: 1,
        backdrops: [],
        posters: [],
      );

      test(
        'should return Failure.general() - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieImages(tId, false))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchMovieImages(tId, false);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Failure.general() - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieImages(tId, true))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchMovieImages(tId, true);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return MovieImageList - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieImages(tId, false))
              .thenAnswer((_) async => tMovieImagesList);

          // act
          final result = await repository.fetchMovieImages(tId, false);

          // assert
          expect(result, right(tMovieImagesList));
        },
      );

      test(
        'should return MovieImageList - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchMovieImages(tId, true))
              .thenAnswer((_) async => tMovieImagesList);

          // act
          final result = await repository.fetchMovieImages(tId, true);

          // assert
          expect(result, right(tMovieImagesList));
        },
      );
    });

    group('fetchVideos()', () {
      const tId = 1;
      const tVideoList = VideoList(id: tId, results: []);

      test(
        'should return Failure.general() - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchVideos(tId, false))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchVideos(tId, false);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Failure.general() - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchVideos(tId, true))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchVideos(tId, true);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return VideoList - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchVideos(tId, false))
              .thenAnswer((_) async => tVideoList);

          // act
          final result = await repository.fetchVideos(tId, false);

          // assert
          expect(result, right(tVideoList));
        },
      );

      test(
        'should return VideoList - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchVideos(tId, true))
              .thenAnswer((_) async => tVideoList);

          // act
          final result = await repository.fetchVideos(tId, true);

          // assert
          expect(result, right(tVideoList));
        },
      );
    });

    group('fetchCredits()', () {
      const tId = 1;
      const tCredits = Credits(id: tId, cast: []);

      test(
        'should return Failure.general() - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchCredits(tId, false))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchCredits(tId, false);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Failure.general() - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchCredits(tId, true))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchCredits(tId, true);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Credits - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchCredits(tId, false))
              .thenAnswer((_) async => tCredits);

          // act
          final result = await repository.fetchCredits(tId, false);

          // assert
          expect(result, right(tCredits));
        },
      );

      test(
        'should return Credits - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchCredits(tId, true))
              .thenAnswer((_) async => tCredits);

          // act
          final result = await repository.fetchCredits(tId, true);

          // assert
          expect(result, right(tCredits));
        },
      );
    });

    group('fetchWatchProviders()', () {
      const tId = 1;
      const tWatchProviders = [
        WatchProvider(
            providerId: 0,
            displayPriority: 1,
            providerName: 'providerName',
            logoPath: 'logoPath')
      ];

      test(
        'should return Failure.general() - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchWatchProviders(tId, false))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchWatchProviders(tId, false);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Failure.general() - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchWatchProviders(tId, true))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchWatchProviders(tId, true);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return List<Watchprovider> - movie',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchWatchProviders(tId, false))
              .thenAnswer((_) async => tWatchProviders);

          // act
          final result = await repository.fetchWatchProviders(tId, false);

          // assert
          expect(result, right(tWatchProviders));
        },
      );

      test(
        'should return List<Watchprovider> - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchWatchProviders(tId, true))
              .thenAnswer((_) async => tWatchProviders);

          // act
          final result = await repository.fetchWatchProviders(tId, true);

          // assert
          expect(result, right(tWatchProviders));
        },
      );
    });

    group('fetchRecommendations()', () {
      const tId = 1;
      const tMovieList = MovieList(
        page: 0,
        totalPages: 100,
        totalResults: 1000,
        results: [],
      );

      test(
        'should return Failure.general() - movie',
        () async {
          // arrange
          when(() =>
                  mockMovieDetailsApiService.fetchRecommendations(tId, false))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchRecommendations(tId, false);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return Failure.general() - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchRecommendations(tId, true))
              .thenThrow(Exception());

          // act
          final result = await repository.fetchRecommendations(tId, true);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return MovieList - movie',
        () async {
          // arrange
          when(() =>
                  mockMovieDetailsApiService.fetchRecommendations(tId, false))
              .thenAnswer((_) async => tMovieList);

          // act
          final result = await repository.fetchRecommendations(tId, false);

          // assert
          expect(result, right(tMovieList));
        },
      );

      test(
        'should return MovieList - tvShow',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchRecommendations(tId, true))
              .thenAnswer((_) async => tMovieList);

          // act
          final result = await repository.fetchRecommendations(tId, true);

          // assert
          expect(result, right(tMovieList));
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
        'should return Failure.general(\'Movie Exception: Movie not found.\')',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchTvShowDetails(1))
              .thenThrow(
            MovieException('Movie not found.'),
          );

          // act
          final result = await repository.fetchTvShowDetails(1);

          // assert
          expect(
            result,
            left(
              const Failure.general(
                  message: 'Movie Exception: Movie not found.'),
            ),
          );
        },
      );

      test(
        'should return Failure.general()',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService.fetchTvShowDetails(1))
              .thenThrow(
            Exception(),
          );

          // act
          final result = await repository.fetchTvShowDetails(1);

          // assert
          expect(
            result,
            left(
              const Failure.general(message: 'Exception'),
            ),
          );
        },
      );

      test(
        'should return TvShowDetails',
        () async {
          // arrange
          when(() => mockMovieDetailsApiService
              .fetchTvShowDetails(tTvShowDetails.id)).thenAnswer(
            (_) async => tTvShowDetails,
          );

          // act
          final result = await repository.fetchTvShowDetails(tTvShowDetails.id);

          // assert
          expect(result, right(tTvShowDetails));
        },
      );
    });
  });
}
