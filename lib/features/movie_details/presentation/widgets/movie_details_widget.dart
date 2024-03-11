import 'package:flutter/material.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_cast_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_images_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_videos_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_description.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/poster_with_info.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/recommended_movies.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/watch_providers_widget.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movie;

  const MovieDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PosterWithInfo(movie: movie),
            MovieDescription(description: movie.overview),
            WatchProvidersWidget(detailsId: movie.id),
            const SizedBox(
              height: 4,
            ),
            const HorizontalVideosList(),
            const SizedBox(
              height: 4,
            ),
            const HorizontalImagesList(),
            const SizedBox(
              height: 4,
            ),
            const HorizontalCastList(),
            const SizedBox(
              height: 4,
            ),
            const RecommendedMovies(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
