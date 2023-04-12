import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'position_count.dart';
import 'poster.dart';

class HorizontalMoviesList extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<Movie> movies;
  final bool showCount;
  final EdgeInsetsGeometry? titlePadding;
  final bool shouldReplacePage;
  const HorizontalMoviesList({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.movies,
    this.showCount = false,
    this.titlePadding,
    this.shouldReplacePage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: titlePadding ?? const EdgeInsets.all(8),
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
                        Poster(
                          id: movies[index].id,
                          posterPath: movies[index].posterPath,
                          shouldReplacePage: shouldReplacePage,
                        ),
                        if (showCount) PositionCount(index: index),
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
