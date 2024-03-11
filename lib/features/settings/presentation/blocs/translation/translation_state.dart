part of 'translation_cubit.dart';

@freezed
class TranslationState with _$TranslationState {
  const TranslationState._();

  const factory TranslationState({
    // Translation language
    required String languageCode,
    // Translations
    required String signIn,
    required String top20Movies,
    required String top20Shows,
    required String genres,
  }) = _TranslationState;

  factory TranslationState.fromJson(Map<String, dynamic> json) =>
      _$TranslationStateFromJson(json);

  factory TranslationState.initial() => const TranslationState(
        languageCode: 'en',
        signIn: 'Sign in',
        top20Movies: 'Top 20 Movies',
        top20Shows: 'Top 20 Tv Shows',
        genres: 'Genres',
      );
}
