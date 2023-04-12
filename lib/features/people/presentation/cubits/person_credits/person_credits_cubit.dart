import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../movies_list/domain/entities/movie.dart';
import '../../../domain/repositories/person_details_repository.dart';
import '../person_details/person_details_cubit.dart';

part 'person_credits_cubit.freezed.dart';
part 'person_credits_state.dart';

@singleton
class PersonCreditsCubit extends Cubit<PersonCreditsState> {
  final PersonDetailsRepository _repository;
  final PersonDetailsCubit _personDetailsCubit;
  late StreamSubscription _streamSubscription;
  PersonCreditsCubit(
    this._repository,
    this._personDetailsCubit,
  ) : super(const PersonCreditsState.initial()) {
    _streamSubscription = _personDetailsCubit.stream.listen((state) {
      state.mapOrNull(loaded: (state) => fetchPersonCredits(state.person.id));
    });
  }

  Future<void> fetchPersonCredits(int personId) async {
    emit(const PersonCreditsState.loading());

    final failureOrCredits = await _repository.fetchPersonCredits(personId);
    await failureOrCredits.fold(
      (_) async => emit(const PersonCreditsState.error()),
      (credits) async => emit(
        PersonCreditsState.loaded(
          movies: credits.cast,
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
