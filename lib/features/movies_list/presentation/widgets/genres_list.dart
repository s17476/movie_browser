import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/horizontal_genres_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/shimmer_horizontal_movies_list.dart';

class Genreslist extends StatelessWidget {
  const Genreslist({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Genres';
    return BlocBuilder<MovieGenresCubit, MovieGenresState>(
      builder: (context, state) {
        return state.maybeMap(
          error: (_) => const Text('Error loading data'),
          loading: (_) => const ShimmerHorizontalMoviesList(title: title),
          loaded: (state) => HorizontalGenresList(
            title: title,
            genres: state.genreList.genres,
          ),
          orElse: () => const Text('init'),
        );
      },
    );
  }
}
