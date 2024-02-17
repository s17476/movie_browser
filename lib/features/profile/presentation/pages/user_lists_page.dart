import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/domain/entities/tv_show_details.dart';
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
  List<MovieDetails> _movies = [];
  List<TvShowDetails> _tvShows = [];
  bool _isLoading = true;

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
  void didChangeDependencies() {
    final userListsCubit = context.watch<UserListsCubit>();
    userListsCubit.state.maybeMap(
      loaded: (state) {
        if (state.listType == widget.listType) {
          _movies = state.movies;
          _tvShows = state.shows;
          _isLoading = false;
        } else {
          context.read<UserListsCubit>().fetchData(listType: widget.listType);
          _isLoading = true;
        }
      },
      loading: (_) => _isLoading = true,
      orElse: () {
        context.read<UserListsCubit>().fetchData(listType: widget.listType);
        return _isLoading = true;
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(_getTitle(widget.listType)),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (_movies.isEmpty && _tvShows.isEmpty)
              ? const Center(child: Text('Nothing here yet.'))
              : MoviesGridView(
                  movies: _movies,
                  shows: _tvShows,
                ),
    );
  }
}
