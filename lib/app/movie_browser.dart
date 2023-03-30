import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';
import 'package:movie_browser/injection.dart';

import '../features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart';
import '../features/movies_list/presentation/pages/home_page.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<Top20MovieListCubit>()),
        BlocProvider(create: (context) => getIt<Top20TvShowsListCubit>()),
        BlocProvider(create: (context) => getIt<Top20MoviesCubit>()),
        BlocProvider(create: (context) => getIt<MovieGenresCubit>()),
        BlocProvider(create: (context) => getIt<RandomGenresCubit>()),
        BlocProvider(create: (context) => getIt<SearchSuggestionsCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          canvasColor: Colors.black,
          navigationBarTheme:
              const NavigationBarThemeData(backgroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black26,
            elevation: 5,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
