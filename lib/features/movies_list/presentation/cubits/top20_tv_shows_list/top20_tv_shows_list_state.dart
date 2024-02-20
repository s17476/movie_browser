part of 'top20_tv_shows_list_cubit.dart';

@freezed
class Top20TvShowsListState with _$Top20TvShowsListState {
  const Top20TvShowsListState._();

  const factory Top20TvShowsListState.initial() = _Initial;
  const factory Top20TvShowsListState.loading() = _Loading;
  const factory Top20TvShowsListState.error() = _Error;
  const factory Top20TvShowsListState.loaded({
    required TvShowList showsList,
  }) = _Loaded;

  @override
  String toString() => maybeMap(
        loaded: (state) =>
            'Loaded.\nLast query: ${state.showsList.lastQuery}\nPage: ${state.showsList.page}\nResults length: ${state.showsList.results.length}\nTotal pages: ${state.showsList.totalPages}',
        orElse: () => super.toString(),
      );
}
