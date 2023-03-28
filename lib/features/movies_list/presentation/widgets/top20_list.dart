import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/top20_movie_list/top20_movie_list_cubit.dart';
import 'horizontal_movies_list.dart';

class Top20List extends StatelessWidget {
  const Top20List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Top20MovieListCubit, Top20MovieListState>(
      builder: (context, state) {
        return state.maybeMap(
          error: (_) => const Text('Error loading data'),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) => HorizontalMoviesList(
            title: 'Top 20 Movies',
            movies: state.movieList.results,
            showCount: true,
          ),
          orElse: () => const Text('init'),
        );
      },
    );
  }
}
