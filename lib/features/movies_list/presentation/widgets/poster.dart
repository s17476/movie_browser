import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../utils/fetch_and_show_movie.dart';

class Poster extends StatelessWidget {
  final int id;
  final String posterPath;
  final bool shouldReplacePage;
  const Poster({
    Key? key,
    required this.id,
    required this.posterPath,
    this.shouldReplacePage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
            FadeInImage.assetNetwork(
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
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => fetchAndShowMovie(context, id, shouldReplacePage),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
