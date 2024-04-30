import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/people/domain/entities/person_details.dart';
import 'package:movie_browser/features/people/domain/repositories/person_details_repository.dart';

part 'person_details_cubit.freezed.dart';
part 'person_details_state.dart';

@singleton
class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final PersonDetailsRepository repository;

  PersonDetailsCubit(
    this.repository,
  ) : super(const PersonDetailsState.initial());

  Future<void> fetchPersonDetails(int personId) async {
    emit(const PersonDetailsState.loading());

    final failureOrPersonDetails =
        await repository.fetchPersonDetails(personId);
    await failureOrPersonDetails.fold(
      (_) async => emit(const PersonDetailsState.error()),
      (personDetails) async => emit(
        PersonDetailsState.loaded(
          person: personDetails,
        ),
      ),
    );
  }
}
