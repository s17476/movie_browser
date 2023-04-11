import 'package:flutter/material.dart';

import '../../domain/entities/video.dart';

class MovieVideo extends StatelessWidget {
  final Video video;
  const MovieVideo({
    Key? key,
    required this.video,
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
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ImagesCarousel(
                  //       images: images,
                  //       initialPage: index,
                  //     ),
                  //   ),
                  // );
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Icon(
                    Icons.play_circle_outline_rounded,
                    size: 50,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
