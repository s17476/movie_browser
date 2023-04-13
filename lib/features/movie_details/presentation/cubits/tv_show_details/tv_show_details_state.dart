part of 'tv_show_details_cubit.dart';

@freezed
class TvShowDetailsState with _$TvShowDetailsState {
  const factory TvShowDetailsState.initial() = _Initial;
  const factory TvShowDetailsState.loading() = _Loading;
  const factory TvShowDetailsState.error() = _Error;
  const factory TvShowDetailsState.loaded({
    required int id,
    required TvShowDetails tvShow,
  }) = _Loaded;
}
