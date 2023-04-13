import 'package:flutter/material.dart';

import '../features/movie_details/presentation/pages/movie_details_page.dart';
import '../features/movie_details/presentation/pages/tv_show_details_page.dart';
import '../features/movie_details/presentation/pages/youtube_video_player.dart';
import '../features/movies_list/presentation/pages/genre_page.dart';
import '../features/movies_list/presentation/pages/home_page.dart';
import '../features/people/presentation/pages/person_details_page.dart';
import 'custom_multi_bloc_provider.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: MaterialApp(
        title: 'Movie Browser',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black26,
            elevation: 0.0,
          ),
        ),
        home: const HomePage(),
        routes: {
          MovieDetailsPage.routeName: (context) => const MovieDetailsPage(),
          TvShowDetailsPage.routeName: (context) => const TvShowDetailsPage(),
          PersonDetailsPage.routeName: (context) => const PersonDetailsPage(),
          YoutubeVideoPlayer.routeName: (context) => const YoutubeVideoPlayer(),
          GenrePage.routeName: (context) => const GenrePage(),
        },
      ),
    );
  }
}
