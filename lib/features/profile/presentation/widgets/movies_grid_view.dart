import 'package:flutter/material.dart';

import '../../../movie_details/domain/entities/movie_details.dart';
import '../../../movie_details/domain/entities/tv_show_details.dart';
import '../../../movies_list/presentation/widgets/poster.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieDetails> movies;
  final List<TvShowDetails> shows;
  const MoviesGridView({
    Key? key,
    required this.movies,
    required this.shows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2 / 3,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 8,
        right: 8,
        bottom: 70,
      ),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        ...movies
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Poster(
                  id: e.id,
                  posterPath: e.posterPath,
                ),
              ),
            )
            .toList(),
        ...shows
            .map(
              (e) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Poster(
                  id: e.id,
                  posterPath: e.posterPath!,
                  isTvShow: true,
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
