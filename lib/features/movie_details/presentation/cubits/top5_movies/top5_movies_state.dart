part of 'top5_movies_cubit.dart';

@freezed
class Top5MoviesState with _$Top5MoviesState {
  const factory Top5MoviesState.initial() = _Initial;
  const factory Top5MoviesState.error() = _Error;
  const factory Top5MoviesState.loading() = _Loading;
  const factory Top5MoviesState.loaded({
    required List<MovieDetails> movies,
  }) = _Loaded;
}
