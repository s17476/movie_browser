import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/credits.dart';
import '../../../domain/repositories/movie_details_repository.dart';
import '../movie_details/movie_details_cubit.dart';

part 'cast_cubit.freezed.dart';
part 'cast_state.dart';

@singleton
class CastCubit extends Cubit<CastState> {
  final MovieDetailsRepository _repository;
  final MovieDetailsCubit _movieDetailsCubit;
  late StreamSubscription _streamSubscription;
  CastCubit(
    this._repository,
    this._movieDetailsCubit,
  ) : super(const CastState.initial()) {
    _streamSubscription = _movieDetailsCubit.stream.listen((state) {
      state.mapOrNull(
        loaded: (state) => fetchCredits(state.id),
      );
    });
  }

  Future<void> fetchCredits(int movieId) async {
    emit(const CastState.loading());

    final failureOrCredits = await _repository.fetchCredits(movieId);
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
    _streamSubscription.cancel();
    return super.close();
  }
}
