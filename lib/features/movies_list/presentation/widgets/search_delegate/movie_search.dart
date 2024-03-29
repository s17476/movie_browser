import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/search_delegate/results_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/search_delegate/suggetions_list.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          context.read<SearchSuggestionsCubit>().clear();
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      context.read<SearchMoviesCubit>().searchMovies(query);
    } else {
      context.read<SearchMoviesCubit>().clear();
    }

    return const ResultsList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // fetch suggestions
    if (query.isNotEmpty) {
      context.read<SearchSuggestionsCubit>().fetchSuggestions(query);
    } else {
      context.read<SearchSuggestionsCubit>().clear();
    }

    return SuggestionsList(search: _search);
  }

  void _search(BuildContext context, String title) {
    query = title;
    showResults(context);
  }
}
