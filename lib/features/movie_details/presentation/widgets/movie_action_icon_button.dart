import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_browser/features/core/utils/show_snack_bar.dart';
import 'package:movie_browser/features/movie_details/utils/show_rate_dialog.dart';

import '../../../profile/presentation/cubits/user_profile/user_profile_cubit.dart';

class MovieActionIconButton extends HookWidget {
  final int movieId;
  final IconData selectedIconData;
  final IconData unselectedIconData;
  final double iconSize;
  final ListType listType;
  const MovieActionIconButton({
    Key? key,
    required this.movieId,
    required this.selectedIconData,
    required this.unselectedIconData,
    this.iconSize = 35,
    required this.listType,
  }) : super(key: key);

  bool _isSelected(BuildContext context) {
    return context.read<UserProfileCubit>().state.listContains(
          listType: listType,
          movieId: movieId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    toggleState.value = _isSelected(context);
    final userProfileCubit = context.read<UserProfileCubit>();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: toggleState.value
          ? IconButton(
              key: const ValueKey('selected'),
              onPressed: () {
                if (listType != ListType.ratedMovies &&
                    listType != ListType.ratedShows) {
                  userProfileCubit.removeMovieFrom(
                    listType: listType,
                    movieId: movieId,
                  );
                } else {
                  showSnackBar(
                    context: context,
                    message: 'You have already rated this movie.',
                  );
                }
              },
              icon: Icon(
                selectedIconData,
                size: iconSize,
                color: Colors.amber,
                shadows: const [
                  Shadow(color: Colors.black, blurRadius: 35),
                  Shadow(color: Colors.black, blurRadius: 35),
                ],
              ),
            )
          : IconButton(
              key: const ValueKey('unselected'),
              onPressed: () {
                if (listType != ListType.ratedMovies &&
                    listType != ListType.ratedShows) {
                  userProfileCubit.addMovieTo(
                    listType: listType,
                    movieId: movieId,
                  );
                } else {
                  showrateDialog(context, listType, movieId);
                }
              },
              icon: Icon(
                unselectedIconData,
                size: iconSize,
                shadows: const [
                  Shadow(color: Colors.black, blurRadius: 35),
                  Shadow(color: Colors.black, blurRadius: 35),
                ],
              ),
            ),
    );
  }
}
