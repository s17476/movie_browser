part of 'category_movies_cubit.dart';

@freezed
class CategoryMoviesState with _$CategoryMoviesState {
  const factory CategoryMoviesState.initial() = _Initial;
  const factory CategoryMoviesState.loading() = _Loading;
  const factory CategoryMoviesState.error() = _Error;
  const factory CategoryMoviesState.loaded({
    required MovieList movieList,
    required int genreId,
    required bool isLoadingNextPage,
  }) = _Loaded;
}
