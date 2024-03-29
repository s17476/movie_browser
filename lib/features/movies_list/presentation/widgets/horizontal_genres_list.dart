import 'package:flutter/material.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';
import 'package:movie_browser/features/movies_list/utils/fetch_by_genre_and_show_movies.dart';

class HorizontalGenresList extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<MovieGenre> genres;
  const HorizontalGenresList({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.genres,
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
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Container(
                  // padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
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
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    height: 80,
                                    'assets/images/${genres[index].name.toLowerCase()}.png',
                                  ),
                                  Text(
                                    genres[index].name,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => fetchByGenreAndShowMovies(
                                    context,
                                    genres[index].id,
                                  ),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
