part of 'localization_cubit.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const LocalizationState._();
  const factory LocalizationState({
    required bool isInitialized,
    required String languageCode,
    required String countryCode,
  }) = _LocalizationState;

  factory LocalizationState.fromJson(Map<String, dynamic> json) =>
      _$LocalizationStateFromJson(json);

  factory LocalizationState.initial() => const LocalizationState(
        isInitialized: false,
        languageCode: 'en',
        countryCode: 'US',
      );

  Locale get getLocale => Locale(languageCode, countryCode);
}
