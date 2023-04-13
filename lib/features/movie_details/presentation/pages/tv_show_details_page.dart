import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/tv_show_details/tv_show_details_cubit.dart';
import '../widgets/movie_details_error_info.dart';
import '../widgets/movie_details_loading_indicator.dart';
import '../widgets/tv_show_details_widget.dart';

class TvShowDetailsPage extends StatelessWidget {
  const TvShowDetailsPage({super.key});

  static const String routeName = '/show-details';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => const MovieDetailsLoadingIndicator(),
          loaded: (state) => TvShowDetailsWidget(show: state.tvShow),
          orElse: () => const MovieDetailsErrorInfo(),
        );
      },
    );
  }
}
