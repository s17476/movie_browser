part of 'recommendations_cubit.dart';

@freezed
class RecommendationsState with _$RecommendationsState {
  const factory RecommendationsState.initial() = _Initial;
  const factory RecommendationsState.loading() = _Loading;
  const factory RecommendationsState.error() = _Error;
  const factory RecommendationsState.loaded({
    required List<Movie> movies,
  }) = _Loaded;
}
