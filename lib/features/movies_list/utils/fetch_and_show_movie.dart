import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/app/custom_router.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';

void fetchAndShowMovie(
  BuildContext context,
  int movieId,
) {
  context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);

  CustomRouter.go(context, Routes.movieDetails);
}
