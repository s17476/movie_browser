import 'package:flutter/material.dart';
import 'package:movie_browser/features/movies_list/domain/entities/tv_show.dart';

import '../../../core/constants/constants.dart';

class HorizontalTvShowsList extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<TvShow> shows;
  final bool showCount;
  const HorizontalTvShowsList({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.shows,
    this.showCount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
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
              itemCount: shows.length,
              itemBuilder: (context, index) {
                if (shows[index].posterPath != null) {
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
                              tag: shows[index].id,
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
                                    '${imagesBaseUrl}w154${shows[index].posterPath}',
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
