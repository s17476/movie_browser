import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

import '../../../domain/entities/movie_list.dart';

part 'search_movies_cubit.freezed.dart';
part 'search_movies_state.dart';

@injectable
class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final MoviesRepository _moviesRepository;

  SearchMoviesCubit(
    this._moviesRepository,
  ) : super(const SearchMoviesState.initial());

  Future<void> searchMovies(String query) async {
    emit(const SearchMoviesState.loading());

    final failureOrMovieList = await _moviesRepository.searchMovies(query);
    await failureOrMovieList.fold(
      (_) async => emit(const SearchMoviesState.error()),
      (movieList) async => emit(
        SearchMoviesState.loaded(
          movieList: movieList,
          isLoadingNextPage: false,
        ),
      ),
    );
  }

  Future<void> clear() async {
    emit(const SearchMoviesState.initial());
  }
}
