part of 'person_credits_cubit.dart';

@freezed
class PersonCreditsState with _$PersonCreditsState {
  const factory PersonCreditsState.initial() = _Initial;
  const factory PersonCreditsState.loading() = _Loading;
  const factory PersonCreditsState.error() = _Error;
  const factory PersonCreditsState.loaded({required List<Movie> movies}) =
      _Loaded;
}
