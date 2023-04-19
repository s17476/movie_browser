
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/domain/entities/tv_show_details.dart';
import '../cubits/user_lists/user_lists_cubit.dart';
import '../cubits/user_profile/user_profile_cubit.dart';
import '../widgets/movies_grid_view.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  static const routeName = '/user-list';

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<MovieDetails> _movies = [];
  List<TvShowDetails> _tvShows = [];
  bool _isLoading = true;
  ListType _listType = ListType.favoriteMovies;

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
    final listType = ModalRoute.of(context)!.settings.arguments;
    if (listType != null && listType is ListType) {
      _listType = listType;
      context.watch<UserListsCubit>().state.maybeMap(
        loaded: (state) {
          if (state.listType == listType) {
            _movies = state.movies;
            _tvShows = state.shows;
            _isLoading = false;
          } else {
            context.read<UserListsCubit>().fetchData(listType: listType);
            _isLoading = true;
          }
        },
        orElse: () {
          context.read<UserListsCubit>().fetchData(listType: listType);
          return _isLoading = true;
        },
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(_getTitle(_listType)),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : MoviesGridView(
              movies: _movies,
              shows: _tvShows,
            ),
    );
  }
}
