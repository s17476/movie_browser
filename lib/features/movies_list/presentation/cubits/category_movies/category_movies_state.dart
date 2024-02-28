part of 'category_movies_cubit.dart';

@freezed
class CategoryMoviesState with _$CategoryMoviesState {
  const CategoryMoviesState._();
  const factory CategoryMoviesState.initial() = _Initial;
  const factory CategoryMoviesState.loading() = _Loading;
  const factory CategoryMoviesState.error() = _Error;
  const factory CategoryMoviesState.loaded({
    required MovieList movieList,
    required int genreId,
    required bool isLoadingNextPage,
  }) = _Loaded;

  @override
  String toString() => maybeMap(
        loaded: (state) =>
            'Loaded.\nLast query: ${state.movieList.lastQuery}\nIs loading next page: ${state.isLoadingNextPage}',
        orElse: () => super.toString(),
      );
}
