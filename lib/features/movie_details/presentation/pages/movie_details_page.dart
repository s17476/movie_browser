import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/movie_details/movie_details_cubit.dart';
import '../widgets/movie_details_error_info.dart';
import '../widgets/movie_details_loading_indicator.dart';
import '../widgets/movie_details_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  static const String route = '/details';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => const MovieDetailsLoadingIndicator(),
          loaded: (state) => MovieDetailsWidget(movie: state.movie),
          orElse: () => const MovieDetailsErrorInfo(),
        );
      },
    );
  }
}
