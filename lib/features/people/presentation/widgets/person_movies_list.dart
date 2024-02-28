import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movies_list/presentation/widgets/horizontal_movies_list.dart';
import 'package:movie_browser/features/people/presentation/cubits/person_credits/person_credits_cubit.dart';

class PersonMoviesList extends StatelessWidget {
  const PersonMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCreditsCubit, PersonCreditsState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            if (state.movies.isNotEmpty) {
              return HorizontalMoviesList(
                title: 'Movies',
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
