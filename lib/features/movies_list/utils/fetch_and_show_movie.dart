import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import '../../movie_details/presentation/pages/movie_details_page.dart';

void fetchAndShowMovie(
  BuildContext context,
  int movieId, [
  bool shouldReplacePage = false,
]) {
  context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);
  if (shouldReplacePage) {
    Navigator.pushReplacementNamed(context, MovieDetailsPage.routeName);
  } else {
    Navigator.pushNamed(context, MovieDetailsPage.routeName);
  }
}
