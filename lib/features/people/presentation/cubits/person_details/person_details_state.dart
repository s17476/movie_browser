part of 'person_details_cubit.dart';

@freezed
class PersonDetailsState with _$PersonDetailsState {
  const factory PersonDetailsState.initial() = _Initial;
  const factory PersonDetailsState.loading() = _Loading;
  const factory PersonDetailsState.error() = _Error;
  const factory PersonDetailsState.loaded({
    required PersonDetails person,
  }) = _Loaded;
}
