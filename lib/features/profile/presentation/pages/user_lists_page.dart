import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/user_lists/user_lists_cubit.dart';
import '../cubits/user_profile/user_profile_cubit.dart';
import '../widgets/movies_grid_view.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key, this.listType = ListType.favoriteMovies});

  final ListType listType;

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String _getTitle(ListType listType) {
    switch (listType) {
      case ListType.favoriteMovies:
        return 'Favorites';
      case ListType.ratedMovies:
        return 'Rated';
      case ListType.watchedMovies:
        return 'Watched';
      case ListType.watchlistMovies:
        return 'Watchlist';
      default:
        return '';
    }
  }

  @override
  void initState() {
    context.read<UserListsCubit>().fetchData(listType: widget.listType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserListsCubit, UserListsState>(
      listener: (context, state) {
        () => switch (state) {
              Loaded() => () {
                  if (state.listType != widget.listType) {
                    context
                        .read<UserListsCubit>()
                        .fetchData(listType: widget.listType);
                  }
                },
              Loading() => null,
              _ => context
                  .read<UserListsCubit>()
                  .fetchData(listType: widget.listType),
            };
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text(_getTitle(widget.listType)),
          ),
          body: switch (state) {
            Loaded() => (state.movies.isEmpty && state.shows.isEmpty)
                ? const Center(child: Text('Nothing here yet.'))
                : MoviesGridView(
                    movies: state.movies,
                    shows: state.shows,
                  ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        );
      },
    );
  }
}
