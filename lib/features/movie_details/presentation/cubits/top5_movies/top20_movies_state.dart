part of 'top20_movies_cubit.dart';

@freezed
class Top20MoviesState with _$Top20MoviesState {
  const factory Top20MoviesState.initial() = _Initial;
  const factory Top20MoviesState.error() = _Error;
  const factory Top20MoviesState.loading() = _Loading;
  const factory Top20MoviesState.loaded({
    required List<MovieDetails> movies,
  }) = _Loaded;
}
