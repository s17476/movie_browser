import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';

part 'recommendations_cubit.freezed.dart';
part 'recommendations_state.dart';

@singleton
class RecommendationsCubit extends Cubit<RecommendationsState> {
  final MovieDetailsRepository repository;
  final MovieDetailsCubit movieDetailsCubit;
  final TvShowDetailsCubit tvShowDetailsCubit;

  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _tvShowStreamSubscription;

  RecommendationsCubit(
    this.repository,
    this.movieDetailsCubit,
    this.tvShowDetailsCubit,
  ) : super(const RecommendationsState.initial()) {
    _movieStreamSubscription = movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchRecommendations(state.id, false),
      );
    });

    _tvShowStreamSubscription = tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchRecommendations(state.id, true),
      );
    });
  }

  Future<void> fetchRecommendations(int movieId, bool isTvShow) async {
    emit(const RecommendationsState.loading());

    final failureOrMovieList =
        await repository.fetchRecommendations(movieId, isTvShow);
    await failureOrMovieList.fold(
      (_) async => emit(const RecommendationsState.error()),
      (movieList) async => emit(
        RecommendationsState.loaded(
          movies: movieList.results,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _movieStreamSubscription.cancel();
    _tvShowStreamSubscription.cancel();
    return super.close();
  }
}
