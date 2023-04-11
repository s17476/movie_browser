import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/images_carousel.dart';

class MovieImage extends StatelessWidget {
  final List<String> images;
  final int index;
  const MovieImage({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
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
              image: '${kImagesBaseUrl}w154${images[index]}',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagesCarousel(
                        images: images,
                        initialPage: index,
                      ),
                    ),
                  );
                },
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
