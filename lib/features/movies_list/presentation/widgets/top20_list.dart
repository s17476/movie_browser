import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/horizontal_movies_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/shimmer_horizontal_movies_list.dart';

class Top20List extends StatelessWidget {
  const Top20List({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Top 20 Movies';
    return BlocBuilder<Top20MovieListCubit, Top20MovieListState>(
      builder: (context, state) {
        return state.maybeMap(
          error: (_) => const Text('Error loading data'),
          loading: (_) => const ShimmerHorizontalMoviesList(title: title),
          loaded: (state) => HorizontalMoviesList(
            title: title,
            movies: state.movieList.results,
            showCount: true,
          ),
          orElse: () => const Text('init'),
        );
      },
    );
  }
}
