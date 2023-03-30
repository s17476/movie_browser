import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/random_genres/random_genres_cubit.dart';
import '../widgets/build_movies_list.dart';
import '../widgets/genres_list.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Movie Browser'),
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
    );
  }
}
