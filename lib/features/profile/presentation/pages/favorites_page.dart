import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/user_profile/user_profile_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static const routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return state.maybeMap(
            loaded: (state) =>
                MoviesGridView(movies: state.userProfile.favoriteMovies),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class MoviesGridView extends StatelessWidget {
  final List<int> movies;
  const MoviesGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => Text(movies[index].toString()),
    );
  }
}
