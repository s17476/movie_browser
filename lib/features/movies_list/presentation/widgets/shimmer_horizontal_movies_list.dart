import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:movie_browser/features/core/constants/constants.dart';

class ShimmerHorizontalMoviesList extends StatelessWidget {
  final String title;
  const ShimmerHorizontalMoviesList({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Shimmer.fromColors(
          baseColor: Theme.of(context).textTheme.titleLarge!.color!,
          highlightColor: kShimmerBaseColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        // list
        Flexible(
          child: SizedBox(
            height: 180,
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // shimmer background
                          Shimmer.fromColors(
                            baseColor: kShimmerBaseColor,
                            highlightColor: kShimmerHighlightColor,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.black,
                            ),
                          ),
                          // movie icon
                          const Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.white12,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
        ),
      ],
    );
  }
}
