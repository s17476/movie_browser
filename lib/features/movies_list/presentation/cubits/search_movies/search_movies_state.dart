part of 'search_movies_cubit.dart';

@freezed
class SearchMoviesState with _$SearchMoviesState {
  const factory SearchMoviesState.initial() = _Initial;
  const factory SearchMoviesState.loading() = _Loading;
  const factory SearchMoviesState.error() = _Error;
  const factory SearchMoviesState.loaded({
    required MovieList movieList,
    required bool isLoadingNextPage,
  }) = _Loaded;
}
