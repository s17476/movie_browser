import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../domain/entities/movie.dart';

class HorizontalMoviesList extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<Movie> movies;
  final bool showCount;
  const HorizontalMoviesList({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.movies,
    this.showCount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
          ),
          child: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Flexible(
          child: SizedBox(
            height: 180,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                if (movies[index].posterPath != null) {
                  return Container(
                    // padding: const EdgeInsets.all(4),
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
                        AspectRatio(
                          aspectRatio: 2 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Hero(
                              tag: movies[index].id,
                              child: FadeInImage.assetNetwork(
                                imageErrorBuilder:
                                    (context, error, stackTrace) =>
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
                                    '${imagesBaseUrl}w92${movies[index].posterPath}',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        if (showCount)
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
                                '#${index + 1}',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
        ),
      ],
    );
  }
}
