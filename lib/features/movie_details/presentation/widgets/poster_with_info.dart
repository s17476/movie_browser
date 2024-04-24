import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/presentation/widgets/images_carousel.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/info_box.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_actions.dart';

class PosterWithInfo extends StatelessWidget {
  final MovieDetails movie;

  const PosterWithInfo({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = ResponsiveWrapper.of(context).isSmallerThan(TABLET)
        ? ((MediaQuery.of(context).size.width * 1.5) + 32)
        : MediaQuery.of(context).size.width * 1.25 + 32;

    return Column(
      children: [
        Stack(
          children: [
            // background image
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading_empty.gif',
                  image: '${kImagesBaseUrl}original${movie.posterPath}',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: height,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ),
              ],
            ),
            // glass efect layer
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: double.infinity,
                  height: height,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // movie poster image
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top -
                          kToolbarHeight +
                          8,
                      left: 16,
                      right: 16,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Hero(
                          tag: movie.id,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                final List<String> images = [];
                                context
                                    .read<MovieImagesCubit>()
                                    .state
                                    .mapOrNull(
                                  loaded: (state) {
                                    images.addAll(state.images);
                                  },
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImagesCarousel(
                                      images: images,
                                    ),
                                  ),
                                );
                              },
                              child: FadeInImage.assetNetwork(
                                imageErrorBuilder:
                                    (context, error, stackTrace) => Container(
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No image found',
                                  ),
                                ),
                                placeholder: 'assets/images/loading.gif',
                                image:
                                    '${kImagesBaseUrl}original${movie.posterPath}',
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.scaleDown,
                                placeholderScale: 5,
                                height: ResponsiveWrapper.of(context)
                                        .isSmallerThan(TABLET)
                                    ? height * 0.73
                                    : MediaQuery.of(context).size.width * 1.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // tagline
                  if (movie.tagline.isNotEmpty)
                    Positioned(
                      bottom: 10,
                      right: 20,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            movie.tagline,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                ]),
                const SizedBox(
                  height: 16,
                ),
                // info box
                InfoBox(
                  movie: movie,
                ),
              ],
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top,
              right: 24,
              child: MovieActions(
                isTvShow: false,
                movieId: movie.id,
              ),
            )
          ],
        ),
      ],
    );
  }
}
