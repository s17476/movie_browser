import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import '../../movie_details/presentation/pages/movie_details_page.dart';

void fetchAndShowMovie(BuildContext context, int movieId) {
  context.read<MovieDetailsCubit>().fetchMovieDetails(movieId);
  Navigator.pushNamed(context, MovieDetailsPage.route);
}
