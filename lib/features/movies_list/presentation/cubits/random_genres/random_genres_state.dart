part of 'random_genres_cubit.dart';

@freezed
class RandomGenresState with _$RandomGenresState {
  const factory RandomGenresState.initial() = _Initial;
  const factory RandomGenresState.loading() = _Loading;
  const factory RandomGenresState.error() = _Error;
  const factory RandomGenresState.loaded({
    required Map<String, MovieList> movieLists,
  }) = _Loaded;
}
