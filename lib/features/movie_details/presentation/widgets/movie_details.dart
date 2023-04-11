import 'package:flutter/material.dart';

import '../../domain/entities/movie_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movie;

  const MovieDetailsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
    );
  }
}
