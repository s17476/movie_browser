import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/person_details.dart';
import '../../../domain/repositories/person_details_repository.dart';

part 'person_details_cubit.freezed.dart';
part 'person_details_state.dart';

@singleton
class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  final PersonDetailsRepository _repository;
  PersonDetailsCubit(
    this._repository,
  ) : super(const PersonDetailsState.initial());

  Future<void> fetchPersonDetails(int personId) async {
    emit(const PersonDetailsState.loading());

    final failureOrPersonDetails =
        await _repository.fetchPersonDetails(personId);
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
