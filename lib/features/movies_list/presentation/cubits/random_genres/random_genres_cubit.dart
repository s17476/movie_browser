import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

part 'random_genres_cubit.freezed.dart';
part 'random_genres_state.dart';

@singleton
class RandomGenresCubit extends Cubit<RandomGenresState> {
  final MoviesRepository _moviesRepository;
  final MovieGenresCubit _movieGenresCubit;

  static const int _randomCategoriesCount = 5;
  RandomGenresCubit(
    this._moviesRepository,
    this._movieGenresCubit,
  ) : super(const RandomGenresState.initial()) {
    // gets genres
    _movieGenresCubit.stream.listen((state) {
      state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            final genres = state.genreList.genres;
            final randomGenres = <MovieGenre>[];
            // pick random categories
            Set<int> randomIndexes = {};
            for (; randomIndexes.length < _randomCategoriesCount;) {
              randomIndexes.add(Random().nextInt(genres.length - 1));
            }
            for (var index in randomIndexes) {
              randomGenres.add(genres[index]);
            }
            fetchMovieListsByGenres(randomGenres);
          });
    });
  }

  Future<void> fetchMovieListsByGenres(List<MovieGenre> genres) async {
    Map<String, MovieList> movieLists = {};

    // fetch movie list for each genre
    for (var genre in genres) {
      final failureOrMovieList =
          await _moviesRepository.fetchByGenreId(genre.id);

      await failureOrMovieList.fold(
        (_) async => null,
        (movieList) async => movieLists.addAll({genre.name: movieList}),
      );
    }

    if (movieLists.isNotEmpty) {
      emit(RandomGenresState.loaded(movieLists: movieLists));
    } else {
      emit(const RandomGenresState.error());
    }
  }
}
