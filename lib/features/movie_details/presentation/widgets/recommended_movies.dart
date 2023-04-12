import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movies_list/presentation/widgets/horizontal_movies_list.dart';
import '../cubits/recommendations/recommendations_cubit.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            if (state.movies.isNotEmpty) {
              return HorizontalMoviesList(
                title: 'Recommendations',
                titleStyle: Theme.of(context).textTheme.bodyMedium,
                titlePadding: const EdgeInsets.only(left: 8),
                movies: state.movies,
                shouldReplacePage: true,
              );
            }
            return const SizedBox();
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
