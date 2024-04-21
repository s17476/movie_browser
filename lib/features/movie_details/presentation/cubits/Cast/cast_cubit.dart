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
  final MovieDetailsRepository repository;
  final MovieDetailsCubit movieDetailsCubit;
  final TvShowDetailsCubit tvShowDetailsCubit;
  late StreamSubscription movieStreamSubscription;
  late StreamSubscription tvShowStreamSubscription;
  CastCubit(
    this.repository,
    this.movieDetailsCubit,
    this.tvShowDetailsCubit,
  ) : super(const CastState.initial()) {
    movieStreamSubscription = movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchCredits(state.id, false),
      );
    });

    tvShowStreamSubscription = tvShowDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchCredits(state.id, true),
      );
    });
  }

  Future<void> fetchCredits(int movieId, bool isTvShow) async {
    emit(const CastState.loading());

    final failureOrCredits = await repository.fetchCredits(movieId, isTvShow);
    await failureOrCredits.fold(
      (_) async => emit(const CastState.error()),
      (credits) async => emit(CastState.loaded(credits: credits)),
    );
  }

  @disposeMethod
  @override
  Future<void> close() {
    movieStreamSubscription.cancel();
    tvShowStreamSubscription.cancel();
    return super.close();
  }
}
