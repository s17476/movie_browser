import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/app/custom_router.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart';

void fetchByGenreAndShowMovies(BuildContext context, int genreId) {
  context.read<CategoryMoviesCubit>().fetchMovies(genreId);

  CustomRouter.go(context, Routes.genrePage);
}
