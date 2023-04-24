import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movies_list/presentation/cubits/random_genres/random_genres_cubit.dart';
import '../../../movies_list/presentation/widgets/build_movies_list.dart';
import '../../../movies_list/presentation/widgets/genres_list.dart';
import '../../../movies_list/presentation/widgets/search_delegate/movie_search.dart';
import '../../../movies_list/presentation/widgets/top20_list.dart';
import '../../../movies_list/presentation/widgets/top20_switcher.dart';
import '../../../movies_list/presentation/widgets/top20_tv_list.dart';
import '../widgets/main_drawer.dart';
import '../widgets/sign_in_listener.dart';
import '../widgets/user_avatar.dart';

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
