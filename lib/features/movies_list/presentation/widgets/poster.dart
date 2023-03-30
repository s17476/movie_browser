import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class Poster extends StatelessWidget {
  final int id;
  final String posterPath;
  const Poster({
    Key? key,
    required this.id,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Hero(
          tag: id,
          child: FadeInImage.assetNetwork(
            imageErrorBuilder: (context, error, stackTrace) => const Center(
              child: Text(
                'No image found',
                textAlign: TextAlign.center,
              ),
            ),
            placeholder: 'assets/images/loading.gif',
            placeholderFit: BoxFit.scaleDown,
            placeholderScale: 2,
            image: '${kImagesBaseUrl}w154$posterPath',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
