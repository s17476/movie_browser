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
        return state.maybeMap(
          loaded: (state) {
            return SizedBox(
              height: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // rate
                  MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.star,
                    unselectedIconData: Icons.star_border,
                    listType:
                        isTvShow ? ListType.ratedShows : ListType.ratedMovies,
                  ),
                  // favorites
                  MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.favorite,
                    unselectedIconData: Icons.favorite_border,
                    listType: isTvShow
                        ? ListType.favoriteShows
                        : ListType.favoriteMovies,
                  ),
                  // watchlist
                  MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.check_box,
                    unselectedIconData: Icons.add_box_outlined,
                    listType: isTvShow
                        ? ListType.watchlistShows
                        : ListType.watchlistMovies,
                  ),
                  // watched
                  MovieActionIconButton(
                    movieId: movieId,
                    selectedIconData: Icons.remove_red_eye,
                    unselectedIconData: Icons.remove_red_eye_outlined,
                    listType: isTvShow
                        ? ListType.watchedShows
                        : ListType.watchedMovies,
                  ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
