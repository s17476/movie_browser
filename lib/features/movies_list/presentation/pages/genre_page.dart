import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movie_details/presentation/widgets/movie_details_error_info.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/genre_widget.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryMoviesCubit, CategoryMoviesState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) => GenreWidget(
            genreId: state.genreId,
            movies: state.movieList.results,
          ),
          error: (_) => const MovieDetailsErrorInfo(),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
