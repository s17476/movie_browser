import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

part 'search_movies_cubit.freezed.dart';
part 'search_movies_state.dart';

@injectable
class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final MoviesRepository moviesRepository;

  SearchMoviesCubit(
    this.moviesRepository,
  ) : super(const SearchMoviesState.initial());

  Future<void> searchMovies(String query) async {
    emit(const SearchMoviesState.loading());

    final failureOrMovieList = await moviesRepository.searchMovies(query);
    await failureOrMovieList.fold(
      (_) async => emit(const SearchMoviesState.error()),
      (movieList) async => emit(
        SearchMoviesState.loaded(
          movieList: movieList.copyWith(lastQuery: query),
          isLoadingNextPage: false,
        ),
      ),
    );
  }

  Future<void> loadNextresultsPage() async {
    await state.mapOrNull(
      loaded: (state) async {
        if (state.movieList.page < state.movieList.totalPages &&
            state.movieList.lastQuery != null &&
            state.movieList.lastQuery!.isNotEmpty) {
          emit(state.copyWith(isLoadingNextPage: true));

          final failureOrMovieList = await moviesRepository.loadNextPage(
            state.movieList.lastQuery!,
            state.movieList.page + 1,
          );
          await failureOrMovieList.fold(
            (_) async => emit(state.copyWith(isLoadingNextPage: false)),
            (movieList) async {
              emit(
                state.copyWith(
                  isLoadingNextPage: false,
                  movieList: state.movieList.copyWith(
                    page: state.movieList.page + 1,
                    results: [...state.movieList.results, ...movieList.results],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Future<void> clear() async {
    emit(const SearchMoviesState.initial());
  }
}
