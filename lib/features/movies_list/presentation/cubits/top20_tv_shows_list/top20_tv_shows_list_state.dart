part of 'top20_tv_shows_list_cubit.dart';

@freezed
class Top20TvShowsListState with _$Top20TvShowsListState {
  const factory Top20TvShowsListState.initial() = _Initial;
  const factory Top20TvShowsListState.loading() = _Loading;
  const factory Top20TvShowsListState.error() = _Error;
  const factory Top20TvShowsListState.loaded({
    required TvShowList showsList,
  }) = _Loaded;
}
