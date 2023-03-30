part of 'search_suggestions_cubit.dart';

@freezed
class SearchSuggestionsState with _$SearchSuggestionsState {
  const factory SearchSuggestionsState.initial() = _Initial;
  const factory SearchSuggestionsState.error() = _Error;
  const factory SearchSuggestionsState.loading() = _Loading;
  const factory SearchSuggestionsState.loaded({
    required MovieList suggestions,
  }) = _Loaded;
}
