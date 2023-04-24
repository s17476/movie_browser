import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/show_snack_bar.dart';
import '../../../profile/presentation/cubits/user_profile/user_profile_cubit.dart';
import 'movie_action_icon_button.dart';

class MovieActions extends StatelessWidget {
  final bool isTvShow;
  final int movieId;
  const MovieActions({
    Key? key,
    required this.isTvShow,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (state) {
            if (state.isError) {
              showSnackBar(context: context, message: 'Error occurred');
            }
          },
          error: (_) =>
              showSnackBar(context: context, message: 'Error occurred'),
        );
      },
      builder: (context, state) {
        return TweenAnimationBuilder(
          key: const ValueKey('tween'),
          duration: const Duration(milliseconds: 500),
          tween: Tween<double>(begin: 0, end: 4),
          builder: (context, value, _) => SizedBox(
            height: 330,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20),
                // rate
                Visibility(
                  visible: value > 1,
                  child: MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.star,
                    unselectedIconData: Icons.star_border,
                    listType:
                        isTvShow ? ListType.ratedShows : ListType.ratedMovies,
                  ),
                ),
                const SizedBox(height: 20),
                // favorites
                Visibility(
                  visible: value > 2,
                  child: MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.favorite,
                    unselectedIconData: Icons.favorite_border,
                    listType: isTvShow
                        ? ListType.favoriteShows
                        : ListType.favoriteMovies,
                  ),
                ),
                const SizedBox(height: 20),
                // watchlist
                Visibility(
                  visible: value > 3,
                  child: MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.check_box,
                    unselectedIconData: Icons.add_box_outlined,
                    listType: isTvShow
                        ? ListType.watchlistShows
                        : ListType.watchlistMovies,
                  ),
                ),
                const SizedBox(height: 20),
                // watched
                Visibility(
                  visible: value == 4,
                  child: MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.remove_red_eye,
                    unselectedIconData: Icons.remove_red_eye_outlined,
                    listType: isTvShow
                        ? ListType.watchedShows
                        : ListType.watchedMovies,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
