import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:movie_browser/app/routes.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/presentation/cubits/current_route/current_route_cubit.dart';
import 'package:movie_browser/features/core/presentation/widgets/star_rating.dart';
import 'package:movie_browser/features/core/utils/format_currency.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/top20_movies/top20_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/utils/fetch_and_show_movie.dart';

class Top20Switcher extends StatefulWidget {
  const Top20Switcher({super.key});

  @override
  State<Top20Switcher> createState() => _Top20SwitcherState();
}

class _Top20SwitcherState extends State<Top20Switcher> {
  int _pos = 0;
  Timer? _timer;
  List<MovieDetails> _movies = [];

  late StreamSubscription _streamSubscription;

  void _tryToSetTimer() async {
    context.read<Top20MoviesCubit>().state.maybeMap(
      loaded: (state) {
        if (state.movies.isNotEmpty) {
          setState(() {
            _movies = state.movies;
            _pos = 0;
          });

          _preloadImages();

          _startTimer();
        }
      },
      orElse: () {
        setState(() {
          _movies = [];
          _timer?.cancel();
        });
      },
    );
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      setState(() {
        if (context.read<CurrentRouteCubit>().state.isCurrent(Routes.home)) {
          _pos = (_pos + 1) % _movies.length;
        }
      });
    });
  }

  void _preloadImages() async {
    if (!kIsWeb) {
      for (var movie in _movies) {
        if (movie.posterPath != null) {
          await DefaultCacheManager().getSingleFile(
            '${kImagesBaseUrl}w500${movie.posterPath}',
          );
        }
      }
    }
  }

  @override
  void initState() {
    _tryToSetTimer();

    _streamSubscription = context.read<Top20MoviesCubit>().stream.listen(
          (_) => _tryToSetTimer(),
        );

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_movies.isNotEmpty) {
      return GestureDetector(
        onTap: () => fetchAndShowMovie(context, _movies[_pos].id),
        onHorizontalDragEnd: (details) {
          int newPos = _pos;

          if (details.primaryVelocity! < 0) {
            newPos = (newPos + 1) % _movies.length;
          } else {
            newPos = (newPos - 1) % _movies.length;
          }

          setState(() {
            _pos = newPos;
          });

          _startTimer();
        },
        child: Stack(
          children: [
            // background
            PosterBackground(movies: _movies, pos: _pos),
            // image
            PosterImage(
              movies: _movies,
              pos: _pos,
            ),
          ],
        ),
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).padding.top + 330,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/images/loading.gif',
          ),
        ),
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  final List<MovieDetails> movies;
  final int pos;
  const PosterImage({
    Key? key,
    required this.movies,
    required this.pos,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 300),
              child: Container(
                key: UniqueKey(),
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width < 600 ? 8 : 32,
                ),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // poster image
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                            FadeInImage(
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Text(
                                  'No image found',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                              placeholderFit: BoxFit.scaleDown,
                              image: CachedNetworkImageProvider(
                                '${kImagesBaseUrl}w500${movies[pos].posterPath}',
                                cacheManager: DefaultCacheManager(),
                              ),
                              fit: BoxFit.fitHeight,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // count
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '#${pos + 1}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        // description
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).padding.top + 330,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        key: UniqueKey(),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            movies[pos].title,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          StarRating(
                            voteAverange: movies[pos].voteAverage,
                          ),
                          if (movies[pos].revenue > 0)
                            Column(
                              children: [
                                // revenue
                                const Text(
                                  'Revenue: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      NumberFormat.simpleCurrency(
                                        locale: 'en_US',
                                      ).currencySymbol,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      formatCurrency(movies[pos].revenue),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PosterBackground extends StatelessWidget {
  final List<MovieDetails> movies;
  final int pos;
  const PosterBackground({
    Key? key,
    required this.movies,
    required this.pos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330 + MediaQuery.of(context).padding.top,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // background image
          SizedBox(
            width: double.infinity,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                final opacityAnimation = Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(animation);
                return FadeTransition(
                  opacity: opacityAnimation,
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 300),
              child: FadeInImage(
                key: UniqueKey(),
                imageErrorBuilder: (context, error, stackTrace) =>
                    const SizedBox(),
                placeholder: const AssetImage('assets/images/loading.gif'),
                placeholderFit: BoxFit.contain,
                image: CachedNetworkImageProvider(
                  '${kImagesBaseUrl}w500${movies[pos].posterPath}',
                  cacheManager: DefaultCacheManager(),
                ),
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          // glass efect layer
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
