import 'package:flutter/material.dart';

import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_cast_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_images_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/horizontal_videos_list.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_description.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/recommended_movies.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/tv_show_poster_with_info.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/warch_providers_widget.dart';

class TvShowDetailsWidget extends StatelessWidget {
  final TvShowDetails show;

  const TvShowDetailsWidget({
    Key? key,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
            TvShowPosterWithInfo(show: show),
            MovieDescription(description: show.overview),
            WatchProvidersWidget(detailsId: show.id),
            const SizedBox(
              height: 4,
            ),
            const HorizontalVideosList(),
            const SizedBox(height: 4),
            const HorizontalImagesList(),
            const SizedBox(height: 4),
            const HorizontalCastList(),
            const SizedBox(height: 4),
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
