import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/search_movies/search_movies_cubit.dart';
import 'movie_list_tile.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
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
            itemCount: state.movieList.results.length,
            itemBuilder: (context, index) => MovieListTile(
              movie: state.movieList.results[index],
            ),
            separatorBuilder: (context, index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade800,
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
