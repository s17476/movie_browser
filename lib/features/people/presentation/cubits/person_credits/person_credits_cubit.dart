import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/people/domain/repositories/person_details_repository.dart';
import 'package:movie_browser/features/people/presentation/cubits/person_details/person_details_cubit.dart';

part 'person_credits_cubit.freezed.dart';
part 'person_credits_state.dart';

@singleton
class PersonCreditsCubit extends Cubit<PersonCreditsState> {
  final PersonDetailsRepository repository;
  final PersonDetailsCubit personDetailsCubit;
  late StreamSubscription streamSubscription;

  PersonCreditsCubit(
    this.repository,
    this.personDetailsCubit,
  ) : super(const PersonCreditsState.initial()) {
    streamSubscription = personDetailsCubit.stream.listen((state) {
      state.mapOrNull(loaded: (state) => fetchPersonCredits(state.person.id));
    });
  }

  Future<void> fetchPersonCredits(int personId) async {
    emit(const PersonCreditsState.loading());

    final failureOrCredits = await repository.fetchPersonCredits(personId);
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
    streamSubscription.cancel();
    return super.close();
  }
}
