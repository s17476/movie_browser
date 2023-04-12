// ignore_for_file: unused_element

part of 'movie_genres_cubit.dart';

@freezed
class MovieGenresState with _$MovieGenresState {
  const MovieGenresState._();

  const factory MovieGenresState.initial() = _Initial;
  const factory MovieGenresState.loading() = _Loading;
  const factory MovieGenresState.error() = _Error;
  const factory MovieGenresState.loaded({
    required MovieGenreList genreList,
  }) = _Loaded;

  String? getGenreNameById(genreId) {
    return mapOrNull(
      loaded: (state) {
        final index = state.genreList.genres
            .indexWhere((element) => element.id == genreId);
        if (index >= 0) {
          return state.genreList.genres[index].name;
        }
        return null;
      },
    );
  }
}
