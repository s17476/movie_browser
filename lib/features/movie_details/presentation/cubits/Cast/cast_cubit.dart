import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/credits.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

part 'cast_cubit.freezed.dart';
part 'cast_state.dart';

@singleton
class CastCubit extends Cubit<CastState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  final TvShowDetailsCubit _tvShowDetailsCubit;
  late StreamSubscription _movieStreamSubscription;
  late StreamSubscription _tvShowStreamSubscription;
  CastCubit(
    this._repository,
    this._movieDetailsCubit,
    this._tvShowDetailsCubit,
  ) : super(const CastState.initial()) {
    _movieStreamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchCredits(state.id, false),
      );
    });

    _tvShowStreamSubscription = _tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchCredits(state.id, true),
      );
    });
  }

  Future<void> fetchCredits(int movieId, bool isTvShow) async {
    emit(const CastState.loading());

    final failureOrCredits = await _repository.fetchCredits(movieId, isTvShow);
    await failureOrCredits.fold(
      (_) async => emit(const CastState.error()),
      (credits) async => emit(
        CastState.loaded(
          credits: credits,
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
