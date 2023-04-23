import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../features/auth/presentation/pages/email_auth_page.dart';
import '../features/movie_details/presentation/pages/movie_details_page.dart';
import '../features/movie_details/presentation/pages/tv_show_details_page.dart';
import '../features/movie_details/presentation/pages/youtube_video_player.dart';
import '../features/movies_list/presentation/pages/genre_page.dart';
import '../features/movies_list/presentation/pages/home_page.dart';
import '../features/people/presentation/pages/person_details_page.dart';
import '../features/profile/presentation/pages/user_lists_page.dart';
import 'custom_multi_bloc_provider.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiBlocProvider(
      child: GestureDetector(
        onTap: () {
          final focusScope = FocusScope.of(context);
          final focusNode = focusScope.focusedChild;
          if (!focusScope.hasPrimaryFocus && focusNode != null) {
            focusNode.unfocus();
          }
        },
        child: MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
          title: 'Movie Browser',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.dark().copyWith(
              primary: Colors.amber.shade800,
              error: Colors.red.shade800,
            ),
            dialogBackgroundColor: Colors.grey.shade900,
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
            YoutubeVideoPlayer.routeName: (context) =>
                const YoutubeVideoPlayer(),
            GenrePage.routeName: (context) => const GenrePage(),
            EmailAuthPage.routeName: (context) => const EmailAuthPage(),
            UserListPage.routeName: (context) => const UserListPage(),
          },
        ),
      ),
    );
  }
}
