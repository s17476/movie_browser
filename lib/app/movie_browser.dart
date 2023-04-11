import 'package:flutter/material.dart';

import '../features/movie_details/presentation/pages/movie_details_page.dart';
import '../features/movie_details/presentation/pages/youtube_video_player.dart';
import '../features/movies_list/presentation/pages/home_page.dart';
import 'custom_multi_bloc_provider.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: MaterialApp(
        title: 'Movie Browser',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          // canvasColor: Colors.black,
          // navigationBarTheme:
          //     const NavigationBarThemeData(backgroundColor: Colors.black),
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black26,
            elevation: 0.0,
          ),
        ),
        home: const HomePage(),
        routes: {
          MovieDetailsPage.routeName: (context) => const MovieDetailsPage(),
          YoutubeVideoPlayer.routeName: (context) => const YoutubeVideoPlayer(),
        },
      ),
    );
  }
}
