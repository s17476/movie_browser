import 'package:flutter/material.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_description.dart';

import '../../domain/entities/movie_details.dart';
import 'poster_with_info.dart';

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            shadows: [
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
          children: [
            PosterWithInfo(movie: movie),
            MovieDescription(movie: movie),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
