import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/cubits/category_movies/category_movies_cubit.dart';
import '../presentation/pages/genre_page.dart';

void fetchByGenreAndShowMovies(BuildContext context, int genreId) {
  context.read<CategoryMoviesCubit>().fetchMovies(genreId);
  Navigator.pushNamed(context, GenrePage.routeName);
}
