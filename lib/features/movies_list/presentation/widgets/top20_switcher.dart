import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/format_currency.dart';
import '../../../core/widgets/star_rating.dart';
import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart';

class Top20Switcher extends StatefulWidget {
  const Top20Switcher({super.key});

  @override
  State<Top20Switcher> createState() => _Top20SwitcherState();
}

class _Top20SwitcherState extends State<Top20Switcher> {
  int _pos = 0;
  Timer? _timer;
  List<MovieDetails> _movies = [];

  @override
  void didChangeDependencies() {
    context.watch<Top20MoviesCubit>().state.maybeMap(
          loaded: (state) {
            _movies = state.movies;
            _pos = 0;
            _timer = Timer.periodic(const Duration(seconds: 10), (_) {
              setState(() {
                _pos = (_pos + 1) % _movies.length;
              });
            });
          },
          orElse: () => null,
        );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_movies.isNotEmpty) {
      return GestureDetector(
        onHorizontalDragEnd: (details) {
          int newPos = _pos;
          if (details.primaryVelocity! < 0) {
            newPos = (newPos + 1) % _movies.length;
          } else {
            newPos = (newPos - 1) % _movies.length;
          }
          setState(() {
            _pos = newPos;
            _timer?.cancel();
            _timer = Timer.periodic(const Duration(seconds: 10), (_) {
              setState(() {
                _pos = (_pos + 1) % _movies.length;
              });
            });
          });
        },
        child: Stack(
          children: [
            // background
            PosterBackground(movies: _movies, pos: _pos),
            // image
            PosterImage(movies: _movies, pos: _pos),
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
  const PosterImage({
    super.key,
    required List<MovieDetails> movies,
    required int pos,
  })  : _movies = movies,
        _pos = pos;

  final List<MovieDetails> _movies;
  final int _pos;

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
                margin: const EdgeInsets.only(left: 8),
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
                        child: FadeInImage.assetNetwork(
                          imageErrorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Text(
                              'No image found',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          placeholder: 'assets/images/loading.gif',
                          placeholderFit: BoxFit.scaleDown,
                          placeholderScale: 2,
                          image:
                              '${imagesBaseUrl}w500${_movies[_pos].posterPath}',
                          fit: BoxFit.fitHeight,
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
                          '#${_pos + 1}',
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
                            _movies[_pos].title,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          StarRating(voteAverange: _movies[_pos].voteAverage),
                          if (_movies[_pos].revenue > 0)
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
                                              locale: 'en_US')
                                          .currencySymbol,
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
                                      formatCurrency(_movies[_pos].revenue),
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
  const PosterBackground({
    super.key,
    required List<MovieDetails> movies,
    required int pos,
  })  : _movies = movies,
        _pos = pos;

  final List<MovieDetails> _movies;
  final int _pos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330 + MediaQuery.of(context).padding.top,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // background image
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              key: UniqueKey(),
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading_empty.gif',
                image: '${imagesBaseUrl}w500${_movies[_pos].posterPath}',
                fit: BoxFit.fitWidth,
                imageErrorBuilder: (context, error, stackTrace) =>
                    const SizedBox(),
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
