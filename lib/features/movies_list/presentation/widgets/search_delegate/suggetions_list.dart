import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/search_delegate/suggestion_tile.dart';

class SuggestionsList extends StatelessWidget {
  final Function(BuildContext, String) search;
  const SuggestionsList({
    Key? key,
    required this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSuggestionsCubit, SearchSuggestionsState>(
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => Center(
            child: Image.asset(
              'assets/images/loading.gif',
              height: 90,
              width: 90,
            ),
          ),
          loaded: (state) => ListView.separated(
            itemCount: state.suggestions.results.length,
            itemBuilder: (context, index) => SuggestionTile(
              movie: state.suggestions.results[index],
              search: search,
            ),
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 1,
              width: double.infinity,
              color: Colors.white12,
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
