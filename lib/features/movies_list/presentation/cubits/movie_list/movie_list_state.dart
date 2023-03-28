part of 'movie_list_cubit.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading({MovieList? movieList}) = _Loading;
  const factory MovieListState.loaded({
    required MovieList movieList,
    required Failure error,
  }) = _Loaded;
  const factory MovieListState.error() = _Error;
}
