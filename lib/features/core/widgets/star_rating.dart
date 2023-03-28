import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double voteAverange;

  const StarRating({
    Key? key,
    required this.voteAverange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int stars = voteAverange ~/ 2;
    final int halfStars = (voteAverange ~/ 1) - (stars * 2);
    final int emptyStars = 5 - stars - halfStars;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            for (int i = 0; i < stars; i++)
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
            for (int i = 0; i < halfStars; i++)
              const Icon(
                Icons.star_half,
                color: Colors.amber,
                size: 16,
              ),
            for (int i = 0; i < emptyStars; i++)
              const Icon(
                Icons.star_border,
                color: Colors.amber,
                size: 16,
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text('$voteAverange/10'),
      ],
    );
  }
}
