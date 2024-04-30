import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

part 'search_suggestions_cubit.freezed.dart';
part 'search_suggestions_state.dart';

@injectable
class SearchSuggestionsCubit extends Cubit<SearchSuggestionsState> {
  final MoviesRepository moviesRepository;
  SearchSuggestionsCubit(
    this.moviesRepository,
  ) : super(const SearchSuggestionsState.initial());

  Future<void> fetchSuggestions(String query) async {
    emit(const SearchSuggestionsState.loading());

    final failureOrMovieList = await moviesRepository.searchMovies(query);

    await failureOrMovieList.fold(
      (_) async => emit(const SearchSuggestionsState.error()),
      (movieList) async => emit(
        SearchSuggestionsState.loaded(suggestions: movieList),
      ),
    );
  }

  Future<void> clear() async {
    emit(const SearchSuggestionsState.initial());
  }
}
