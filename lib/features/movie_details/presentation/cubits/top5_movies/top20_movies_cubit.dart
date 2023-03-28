import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../movies_list/domain/entities/movie.dart';
import '../../../../movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/repositories/movie_details_repository.dart';

part 'top20_movies_cubit.freezed.dart';
part 'top20_movies_state.dart';

@singleton
class Top20MoviesCubit extends Cubit<Top20MoviesState> {
  final MovieDetailsRepository _repository;
  final Top20MovieListCubit _top20movieListCubit;
  late StreamSubscription _top20StreamSubscription;
  Top20MoviesCubit(
    this._top20movieListCubit,
    this._repository,
  ) : super(const Top20MoviesState.initial()) {
    _top20movieListCubit.stream.listen((state) {
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
          await _repository.fetchMovieDetails(movie.id);
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
