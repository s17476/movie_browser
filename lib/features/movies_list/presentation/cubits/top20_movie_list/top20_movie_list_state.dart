part of 'top20_movie_list_cubit.dart';

@freezed
class Top20MovieListState with _$Top20MovieListState {
  const factory Top20MovieListState.initial() = _Initial;
  const factory Top20MovieListState.loading() = _Loading;
  const factory Top20MovieListState.error() = _Error;
  const factory Top20MovieListState.loaded({
    required MovieList movieList,
  }) = _Loaded;
}
