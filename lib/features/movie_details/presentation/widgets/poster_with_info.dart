import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/constants/constants.dart';
import '../../../core/presentation/widgets/images_carousel.dart';
import '../../domain/entities/movie_details.dart';
import '../cubits/movie_images/movie_images_cubit.dart';
import 'info_box.dart';
import 'movie_actions.dart';

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
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading_empty.gif',
              image: '${kImagesBaseUrl}original${movie.posterPath}',
              fit: BoxFit.fill,
              width: double.infinity,
              height: height,
              imageErrorBuilder: (context, error, stackTrace) =>
                  const SizedBox(),
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
                      top: MediaQueryData.fromWindow(window).padding.top + 8,
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
                              child: FadeInImage(
                                imageErrorBuilder:
                                    (context, error, stackTrace) => Container(
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'No image found',
                                  ),
                                ),
                                placeholder: const AssetImage(
                                  'assets/images/loading.gif',
                                ),
                                image: CachedNetworkImageProvider(
                                  '${kImagesBaseUrl}original${movie.posterPath}',
                                ),
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.scaleDown,
                                // placeholderScale: 5,
                                // height: 450,
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(movie.tagline, softWrap: true),
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
