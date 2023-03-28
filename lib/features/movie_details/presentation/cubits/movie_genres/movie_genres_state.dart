part of 'movie_genres_cubit.dart';

@freezed
class MovieGenresState with _$MovieGenresState {
  const factory MovieGenresState.initial() = _Initial;
  const factory MovieGenresState.loading() = _Loading;
  const factory MovieGenresState.error() = _Error;
  const factory MovieGenresState.loaded({
    required MovieGenreList genreList,
  }) = _Loaded;
}
