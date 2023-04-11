part of 'movie_details_cubit.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.error() = _Error;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.loaded({
    required int id,
    required MovieDetails movie,
  }) = _Loaded;
}
