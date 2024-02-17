import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/app/custom_router.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';

void fetchAndShowTvShow(
  BuildContext context,
  int showId,
) {
  context.read<TvShowDetailsCubit>().fetchTvShowDetails(showId);

  CustomRouter.go(context, Routes.tvShowDetails);
}
