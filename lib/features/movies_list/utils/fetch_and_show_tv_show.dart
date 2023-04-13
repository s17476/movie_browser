import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';
import '../../movie_details/presentation/pages/tv_show_details_page.dart';

void fetchAndShowTvShow(
  BuildContext context,
  int showId, [
  bool shouldReplacePage = false,
]) {
  context.read<TvShowDetailsCubit>().fetchTvShowDetails(showId);
  if (shouldReplacePage) {
    Navigator.pushReplacementNamed(context, TvShowDetailsPage.routeName);
  } else {
    Navigator.pushNamed(context, TvShowDetailsPage.routeName);
  }
}
