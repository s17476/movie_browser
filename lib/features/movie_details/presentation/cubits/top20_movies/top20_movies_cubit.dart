import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';

part 'top20_movies_cubit.freezed.dart';
part 'top20_movies_state.dart';

@singleton
class Top20MoviesCubit extends Cubit<Top20MoviesState> {
  final MovieDetailsRepository repository;
  final Top20MovieListCubit top20movieListCubit;

  late StreamSubscription _top20StreamSubscription;

  Top20MoviesCubit(
    this.top20movieListCubit,
    this.repository,
  ) : super(const Top20MoviesState.initial()) {
    _top20StreamSubscription = top20movieListCubit.stream.listen((state) {
      state.maybeMap(
        loaded: (state) => fetchTop20(state.movieList.results),
        orElse: () => null,
      );
    });
  }

  Future<void> fetchTop20(List<Movie> movieList) async {
    List<MovieDetails> movies = [];
    for (var movie in movieList) {
      final failureOrMovieDetails =
          await repository.fetchMovieDetails(movie.id);

      await failureOrMovieDetails.fold(
        (_) async => null,
        (movie) async => movies.add(movie),
      );
    }
    if (movies.isEmpty) {
      emit(const Top20MoviesState.error());
    } else {
      emit(Top20MoviesState.loaded(movies: movies));
    }
  }

  @override
  Future<void> close() {
    _top20StreamSubscription.cancel();
    return super.close();
  }
}
