import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart';
import 'horizontal_tv_shows_list.dart';
import 'shimmer_horizontal_movies_list.dart';

class Top20TvList extends StatelessWidget {
  const Top20TvList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Top 20 Tv Shows';
    return BlocBuilder<Top20TvShowsListCubit, Top20TvShowsListState>(
      builder: (context, state) {
        return state.maybeMap(
          error: (_) => const Text('Error loading data'),
          loading: (_) => const ShimmerHorizontalMoviesList(title: title),
          loaded: (state) => HorizontalTvShowsList(
            title: title,
            shows: state.showsList.results,
            showCount: true,
          ),
          orElse: () => const Text('init'),
        );
      },
    );
  }
}
