import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../movies_list/domain/entities/movie.dart';
import '../../../domain/repositories/movie_details_repository.dart';
import '../movie_details/movie_details_cubit.dart';
import '../tv_show_details/tv_show_details_cubit.dart';

part 'recommendations_cubit.freezed.dart';
part 'recommendations_state.dart';

@singleton
class RecommendationsCubit extends Cubit<RecommendationsState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  final TvShowDetailsCubit _tvShowDetailsCubit;
  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _tvShowStreamSubscription;
  RecommendationsCubit(
    this._repository,
    this._movieDetailsCubit,
    this._tvShowDetailsCubit,
  ) : super(const RecommendationsState.initial()) {
    _movieStreamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchRecommendations(state.id),
      );
    });

    _tvShowStreamSubscription = _tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchTvShowRecommendations(state.id),
      );
    });
  }

  Future<void> fetchRecommendations(int movieId) async {
    emit(const RecommendationsState.loading());

    final failureOrMovieList = await _repository.fetchRecommendations(movieId);
    await failureOrMovieList.fold(
      (_) async => emit(const RecommendationsState.error()),
      (movieList) async => emit(
        RecommendationsState.loaded(
          movies: movieList.results,
        ),
      ),
    );
  }

  Future<void> fetchTvShowRecommendations(int showId) async {
    emit(const RecommendationsState.loading());

    final failureOrMovieList =
        await _repository.fetchTvShowRecommendations(showId);
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
