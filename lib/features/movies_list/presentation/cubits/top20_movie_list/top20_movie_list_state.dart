part of 'top20_movie_list_cubit.dart';

@freezed
class Top20MovieListState with _$Top20MovieListState {
  const Top20MovieListState._();
  const factory Top20MovieListState.initial() = _Initial;
  const factory Top20MovieListState.loading() = _Loading;
  const factory Top20MovieListState.error() = _Error;
  const factory Top20MovieListState.loaded({
    required MovieList movieList,
  }) = _Loaded;

  @override
  String toString() => maybeMap(
        loaded: (state) =>
            'Loaded.\nLast query: ${state.movieList.lastQuery}\nPage: ${state.movieList.page}\nResults length: ${state.movieList.results.length}\nTotal pages: ${state.movieList.totalPages}',
        orElse: () => super.toString(),
      );
}
