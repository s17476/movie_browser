import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/movies_repository.dart';
import '../../../domain/entities/movie_list.dart';

part 'category_movies_cubit.freezed.dart';
part 'category_movies_state.dart';

@singleton
class CategoryMoviesCubit extends Cubit<CategoryMoviesState> {
  final MoviesRepository _repository;
  CategoryMoviesCubit(
    this._repository,
  ) : super(const CategoryMoviesState.initial());

  Future<void> fetchMovies(int genreId) async {
    emit(const CategoryMoviesState.loading());

    final failureOrMovieList = await _repository.fetchByGenreId(genreId);
    await failureOrMovieList.fold(
      (_) async => emit(const CategoryMoviesState.loading()),
      (movieList) async => emit(
        CategoryMoviesState.loaded(
          movieList: movieList,
          isLoadingNextPage: false,
          genreId: genreId,
        ),
      ),
    );
  }

  Future<void> loadNextResultsPage() async {
    await state.mapOrNull(
      loaded: (state) async {
        if (state.movieList.page < state.movieList.totalPages) {
          emit(state.copyWith(isLoadingNextPage: true));

          final failureOrMovieList = await _repository.fetchNextPageByGenreId(
            state.genreId,
            state.movieList.page + 1,
          );
          await failureOrMovieList.fold(
            (_) async => emit(state.copyWith(isLoadingNextPage: false)),
            (movieList) async => emit(
              state.copyWith(
                isLoadingNextPage: false,
                movieList: state.movieList.copyWith(
                  page: state.movieList.page + 1,
                  results: [...state.movieList.results, ...movieList.results],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
