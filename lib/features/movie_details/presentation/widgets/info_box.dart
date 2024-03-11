import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:movie_browser/features/core/utils/format_currency.dart';
import 'package:movie_browser/features/core/presentation/widgets/star_rating.dart';
import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';

class InfoBox extends StatelessWidget {
  final MovieDetails movie;

  const InfoBox({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.simpleCurrency(locale: 'en_US');
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      color: Colors.black26,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // movie title
                    Text(
                      movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // release year
                    if (movie.releaseDate.isNotEmpty)
                      Row(
                        children: [
                          Text(
                            'Year: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            movie.releaseDate.toString().substring(0, 4),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 4,
                    ),
                    // genres
                    if (movie.genres.isNotEmpty)
                      Wrap(
                        children: [
                          Text(
                            'Genres: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          for (var genre in movie.genres)
                            Text(
                              '${genre.name}, ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white70),
                            ),
                        ],
                      )
                  ],
                ),
              ),
              Column(
                children: [
                  // star rating
                  StarRating(
                    voteAverange: movie.voteAverage,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // total votes
                  Text(
                    '${movie.voteCount} votes',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          // budget
          if (movie.budget > 0 && movie.revenue > 0)
            Row(
              children: [
                const Text(
                  'Budget: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  format.currencySymbol,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  formatCurrency(movie.budget),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                // revenue
                const Text(
                  'Revenue: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  format.currencySymbol,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  formatCurrency(movie.revenue),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
