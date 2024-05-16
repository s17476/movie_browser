import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/auth/presentation/pages/email_auth_page.dart';
import 'package:movie_browser/features/core/presentation/cubits/current_route/current_route_cubit.dart';
import 'package:movie_browser/features/core/presentation/pages/home_page.dart';
import 'package:movie_browser/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:movie_browser/features/movie_details/presentation/pages/tv_show_details_page.dart';
import 'package:movie_browser/features/movie_details/presentation/pages/youtube_video_player.dart';
import 'package:movie_browser/features/movies_list/presentation/pages/genre_page.dart';
import 'package:movie_browser/features/people/presentation/pages/person_details_page.dart';
import 'package:movie_browser/features/profile/presentation/cubits/user_profile/user_profile_cubit.dart';
import 'package:movie_browser/features/profile/presentation/pages/user_details_page.dart';
import 'package:movie_browser/features/profile/presentation/pages/user_lists_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class CustomRouter {
  CustomRouter._();

  static void go(BuildContext context, String route) {
    final currentRoute = context.read<CurrentRouteCubit>().state.route;
    String updatedRoute = route;

    if (currentRoute.endsWith(updatedRoute)) {
      updatedRoute = currentRoute;
    } else if (!currentRoute.contains(updatedRoute) &&
        currentRoute != Routes.home) {
      updatedRoute = currentRoute + updatedRoute;
    }

    if (updatedRoute.contains(Routes.tvShowDetails) &&
        updatedRoute.contains(Routes.movieDetails)) {
      updatedRoute = route;
    }

    context.go(updatedRoute);
  }

  // static Object? _redirectionExtra;
  static GoRouter? _routerConfig;

  static GoRouter routerConfig() => _routerConfig ??= _buildRouter();

  static GoRouter _buildRouter() => GoRouter(
        debugLogDiagnostics: true,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
              path: Routes.home,
              builder: (_, __) => const _Observer(child: HomePage()),
              routes: [
                GoRoute(
                  path: 'movieDetails',
                  builder: (_, __) => const MovieDetailsPage(),
                  routes: [
                    GoRoute(
                      path: 'ytPlayer',
                      builder: (_, state) {
                        final videoId = state.extra as String;
                        return YoutubeVideoPlayer(vodeoId: videoId);
                      },
                    ),
                    GoRoute(
                      path: 'personDetails',
                      builder: (_, __) => const PersonDetailsPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'tvShowDetails',
                  builder: (_, __) => const TvShowDetailsPage(),
                  routes: [
                    GoRoute(
                      path: 'ytPlayer',
                      builder: (_, state) {
                        final videoId = state.extra as String;
                        return YoutubeVideoPlayer(vodeoId: videoId);
                      },
                    ),
                    GoRoute(
                      path: 'personDetails',
                      builder: (_, __) => const PersonDetailsPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'userDetailsPage',
                  builder: (_, __) => const UserDetailsPage(),
                ),
                GoRoute(
                    path: 'genrePage',
                    builder: (_, __) => const GenrePage(),
                    routes: [
                      GoRoute(
                        path: 'movieDetails',
                        builder: (_, __) => const MovieDetailsPage(),
                        routes: [
                          GoRoute(
                            path: 'ytPlayer',
                            builder: (_, state) {
                              final videoId = state.extra as String;
                              return YoutubeVideoPlayer(vodeoId: videoId);
                            },
                          ),
                          GoRoute(
                            path: 'personDetails',
                            builder: (_, __) => const PersonDetailsPage(),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'tvShowDetails',
                        builder: (_, __) => const TvShowDetailsPage(),
                        routes: [
                          GoRoute(
                            path: 'ytPlayer',
                            builder: (_, state) {
                              final videoId = state.extra as String;
                              return YoutubeVideoPlayer(vodeoId: videoId);
                            },
                          ),
                          GoRoute(
                            path: 'personDetails',
                            builder: (_, __) => const PersonDetailsPage(),
                          ),
                        ],
                      ),
                    ]),
                GoRoute(
                  path: 'emailAuthPage',
                  builder: (_, __) => const EmailAuthPage(),
                ),
                GoRoute(
                    path: 'userListPage',
                    builder: (_, state) {
                      final listType = state.extra as ListType?;
                      if (listType != null) {
                        return UserListPage(
                          listType: listType,
                        );
                      }
                      return const UserListPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'movieDetails',
                        builder: (_, __) => const MovieDetailsPage(),
                        routes: [
                          GoRoute(
                            path: 'ytPlayer',
                            builder: (_, state) {
                              final videoId = state.extra as String;
                              return YoutubeVideoPlayer(vodeoId: videoId);
                            },
                          ),
                          GoRoute(
                            path: 'personDetails',
                            builder: (_, __) => const PersonDetailsPage(),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: 'tvShowDetails',
                        builder: (_, __) => const TvShowDetailsPage(),
                        routes: [
                          GoRoute(
                            path: 'ytPlayer',
                            builder: (_, state) {
                              final videoId = state.extra as String;
                              return YoutubeVideoPlayer(vodeoId: videoId);
                            },
                          ),
                          GoRoute(
                            path: 'personDetails',
                            builder: (_, __) => const PersonDetailsPage(),
                          ),
                        ],
                      ),
                    ]),
              ]),
        ],
      );
}

class _Observer extends StatefulWidget {
  const _Observer({required this.child});

  final Widget child;

  @override
  State<_Observer> createState() => _Observer2State();
}

class _Observer2State extends State<_Observer> with WidgetsBindingObserver {
  final List<({String route, DateTime timeStamp})> _routes = [];

  bool _isInBackground = false;
  late CurrentRouteCubit _currentRouteCubit;
  late GoRouter _goRouter;

  void _logEventToGoogleAnalytics(
      ({
        String route,
        DateTime timeStamp,
      }) route) async {
    final now = DateTime.now();
    final timeSpentOnPageInSeconds = now.difference(route.timeStamp).inSeconds;

    final timeSpent =
        '${timeSpentOnPageInSeconds ~/ 60}:${timeSpentOnPageInSeconds % 60}';

    if (kDebugMode) {
      print(
        'Router Event: TimeSpent: $timeSpent Route: ${route.route}',
      );
    } else {
      FirebaseAnalytics.instance.logEvent(
        //event name can contain only alphanummeric characters and underscore
        name: 'route${route.route.replaceAll(r'/', '_')}',
        parameters: <String, dynamic>{
          'timeSpent': timeSpent,
          'timeSpentInSeconds': '$timeSpentOnPageInSeconds',
        },
      );
    }
  }

  Future<String> _getCurrentRoute() async {
    final matchList = await _goRouter.routeInformationParser
        .parseRouteInformationWithDependencies(
      _goRouter.routeInformationProvider.value,
      context,
    );

    return matchList.matches.last.matchedLocation;
  }

  void _logAllRoutes() {
    final now = DateTime.now();

    for (var i = _routes.length - 1; i >= 0; i--) {
      //log last route
      _logEventToGoogleAnalytics(_routes[i]);
      Duration timeSpentOnLastRoute = now.difference(_routes[i].timeStamp);
      // update earlier routes
      for (var j = 0; j < i; j++) {
        final route = _routes[j];
        _routes.removeAt(j);
        _routes.insert(j, (
          route: route.route,
          timeStamp: route.timeStamp.add(timeSpentOnLastRoute),
        ));
      }
    }
    _routes.clear();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _goRouter = GoRouter.of(context);
    _goRouter.routerDelegate.addListener(_listener);
    _currentRouteCubit = context.read<CurrentRouteCubit>();

    Future(() async {
      final currentRoute = await _getCurrentRoute();

      _currentRouteCubit.update(currentRoute);
      _routes.add((route: currentRoute, timeStamp: DateTime.now()));
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future(() async {
        final currentRoute = await _getCurrentRoute();

        _currentRouteCubit.update(currentRoute);
        _routes.add((route: currentRoute, timeStamp: DateTime.now()));
      });
      _isInBackground = false;
    } else if (state == AppLifecycleState.inactive) {
      if (!_isInBackground) {
        _logAllRoutes();
        _isInBackground = true;
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _goRouter.routerDelegate.removeListener(_listener);
    super.dispose();
  }

  _listener() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final currentRoute = await _getCurrentRoute();
      final lastRoute = _routes.last;

      // if current route is a subroute of lase route => pushed to subroute
      if (currentRoute.contains(lastRoute.route)) {
        _routes.add((route: currentRoute, timeStamp: DateTime.now()));
        //if last route is a subroute of current route => back from subroute
      } else if (lastRoute.route.contains(currentRoute)) {
        final now = DateTime.now();
        //log and remove last route
        _logEventToGoogleAnalytics(lastRoute);
        _routes.removeLast();

        //subtract time spent on subroute from its toproutes by adding duration to timestamp
        final timeSpentOnLastRoute = now.difference(lastRoute.timeStamp);
        final routesLenght = _routes.length;
        for (var i = 0; i < routesLenght; i++) {
          final route = _routes[i];
          _routes.removeAt(i);
          _routes.insert(i, (
            route: route.route,
            timeStamp: route.timeStamp.add(timeSpentOnLastRoute),
          ));
        }
        if (_routes.isEmpty) {
          _routes.add((route: currentRoute, timeStamp: DateTime.now()));
        }
        //log everything to analytics
      } else {
        _logAllRoutes();
        _routes.add((route: currentRoute, timeStamp: DateTime.now()));
      }

      //update cubit
      _currentRouteCubit.update(currentRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
