part of 'random_genres_cubit.dart';

@freezed
class RandomGenresState with _$RandomGenresState {
  const RandomGenresState._();
  const factory RandomGenresState.initial() = _Initial;
  const factory RandomGenresState.loading() = _Loading;
  const factory RandomGenresState.error() = _Error;
  const factory RandomGenresState.loaded({
    required Map<String, MovieList> movieLists,
  }) = _Loaded;

  @override
  String toString() => maybeMap(
        loaded: (state) => 'Loaded.\nKeys: ${state.movieLists.keys}',
        orElse: () => super.toString(),
      );
}
