import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../auth/utils/show_auth_providers_dialog.dart';
import '../../../core/utils/show_snack_bar.dart';
import '../../../profile/presentation/cubits/user_profile/user_profile_cubit.dart';
import '../../utils/show_rate_dialog.dart';

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

  void _showFeedback(BuildContext context) {
    String message = '';
    if (listType == ListType.favoriteMovies ||
        listType == ListType.favoriteShows) {
      message = 'Added to favorites';
    } else if (listType == ListType.watchedMovies ||
        listType == ListType.watchedShows) {
      message = 'Added to watched';
    } else if (listType == ListType.watchlistMovies ||
        listType == ListType.watchlistShows) {
      message = 'Added to watchlist';
    }

    if (message.isNotEmpty) {
      showSnackBar(context: context, message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);
    toggleState.value = _isSelected(context);
    final userProfileCubit = context.read<UserProfileCubit>();
    return TweenAnimationBuilder(
      key: const ValueKey('tween'),
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: AnimatedSwitcher(
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
                  userProfileCubit.state.maybeMap(
                    loaded: (_) {
                      if (listType != ListType.ratedMovies &&
                          listType != ListType.ratedShows) {
                        userProfileCubit.addMovieTo(
                          listType: listType,
                          movieId: movieId,
                        );
                        _showFeedback(context);
                      } else {
                        showrateDialog(context, listType, movieId);
                      }
                    },
                    orElse: () => showAuthProvidersDialog(context),
                  );
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
      ),
    );
  }
}
