import 'package:flutter/material.dart';

import '../../domain/entities/tv_show.dart';
import 'position_count.dart';
import 'poster.dart';

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
                        Poster(
                          id: shows[index].id,
                          posterPath: shows[index].posterPath,
                          isTvShow: true,
                        ),
                        if (showCount)
                          PositionCount(
                            index: index,
                          ),
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
