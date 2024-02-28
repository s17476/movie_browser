import 'package:flutter/material.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/core/presentation/widgets/star_rating.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/utils/fetch_and_show_movie.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;

  const MovieListTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // go to details screen
            fetchAndShowMovie(context, movie.id);
          },
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // movie poster image
                if (movie.posterPath != null)
                  SizedBox(
                    height: 100,
                    width: 70,
                    child: Hero(
                      tag: movie.id,
                      child: FadeInImage.assetNetwork(
                        imageErrorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Text(
                            'No image found',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        placeholder: 'assets/images/loading.gif',
                        placeholderScale: 1,
                        image: '${kImagesBaseUrl}w92${movie.posterPath}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                if (movie.posterPath == null)
                  Container(
                    height: 100,
                    width: 70,
                    alignment: Alignment.center,
                    child: const Text(
                      'No image found',
                      textAlign: TextAlign.center,
                    ),
                  ),
                // movie description section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // movie title
                        Text(
                          movie.title,
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.clip,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        // release year
                        if (movie.releaseDate != '')
                          Text(
                            movie.releaseDate.toString().substring(0, 4),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white38,
                            ),
                          ),
                        // movie description
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              movie.overview,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // star rating
                StarRating(voteAverange: movie.voteAverage),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
