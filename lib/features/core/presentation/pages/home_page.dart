import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/core/presentation/widgets/main_drawer.dart';
import 'package:movie_browser/features/core/presentation/widgets/sign_in_listener.dart';
import 'package:movie_browser/features/core/presentation/widgets/user_avatar.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/build_movies_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/genres_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/search_delegate/movie_search.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/top20_list.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/top20_switcher.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/top20_tv_list.dart';

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
    context.watch<RandomGenresCubit>().state.mapOrNull(
      loaded: (state) {
        if (_randomCategoryLists.isEmpty) {
          _randomCategoryLists = buildMoviesLists(state.movieLists);
        }
      },
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SignInListener(
      child: Scaffold(
        drawer: const MainDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.65),
          title: const Text('Movie Browser'),
          leading: Builder(builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const UserAvatar(),
            );
          }),
          actions: [
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
          addAutomaticKeepAlives: true,
          children: [
            const Top20Switcher(key: ValueKey('top-switcher')),
            const Top20List(key: ValueKey('top-movies')),
            const Top20TvList(key: ValueKey('top-tv')),
            const Genreslist(key: ValueKey('genres')),
            ..._randomCategoryLists
          ],
        ),
      ),
    );
  }
}
