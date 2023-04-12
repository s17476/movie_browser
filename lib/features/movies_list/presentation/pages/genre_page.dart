import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_details/presentation/widgets/movie_details_error_info.dart';
import '../cubits/category_movies/category_movies_cubit.dart';
import '../widgets/genre_widget.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  static const routeName = '/genre-page';

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
