import 'package:flutter/material.dart';

import 'package:movie_browser/features/core/presentation/widgets/star_rating.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';

class TvShowInfoBox extends StatelessWidget {
  final TvShowDetails show;

  const TvShowInfoBox({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
                      show.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // release year
                    if (show.firstAirDate.isNotEmpty)
                      Row(
                        children: [
                          Text(
                            'First air date: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            show.firstAirDate,
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
                    if (show.genres.isNotEmpty)
                      Wrap(
                        children: [
                          Text(
                            'Genres: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          for (var genre in show.genres)
                            Text(
                              '${genre.name}, ',
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
                    // seasons
                    Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Seasons: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              show.numberOfSeasons.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white70),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Episodes: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              show.numberOfEpisodes.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // seasons
                    Row(
                      children: [
                        Text(
                          'Status: ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          show.status,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  // star rating
                  StarRating(
                    voteAverange: show.voteAverage,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // total votes
                  Text(
                    '${show.voteCount} votes',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
