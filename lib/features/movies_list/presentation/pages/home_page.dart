import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/auth/utils/show_auth_providers_dialog.dart';
import 'package:movie_browser/features/auth/utils/show_signout_dialog.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../core/utils/show_snack_bar.dart';
import '../cubits/random_genres/random_genres_cubit.dart';
import '../widgets/build_movies_list.dart';
import '../widgets/genres_list.dart';
import '../widgets/search_delegate/movie_search.dart';
import '../widgets/top20_list.dart';
import '../widgets/top20_switcher.dart';
import '../widgets/top20_tv_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _randomCategoryLists = [];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // loads random movie lists
    context.watch<RandomGenresCubit>().state.maybeMap(
        loaded: (state) {
          _randomCategoryLists = buildMoviesLists(state.movieLists);
        },
        orElse: () => null);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        state.mapOrNull(
          authenticated: (state) =>
              showSnackBar(context: context, message: state.toString()),
        );
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Movie Browser'),
          actions: [
            BlocBuilder<AuthBloc, AuthBlocState>(
              builder: (context, state) {
                return state.maybeMap(
                  // signout
                  authenticated: (state) => IconButton(
                    onPressed: () => showSignoutDialog(context: context),
                    icon: const Icon(Icons.person_off),
                  ),
                  // go to login page
                  orElse: () => IconButton(
                    onPressed: () => showAuthProvidersDialog(context),
                    icon: const Icon(Icons.person),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: MovieSearch(),
              ),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 32,
          ),
          children: [
            const Top20Switcher(),
            const Top20List(),
            const Top20TvList(),
            const Genreslist(),
            ..._randomCategoryLists
          ],
        ),
      ),
    );
  }
}
