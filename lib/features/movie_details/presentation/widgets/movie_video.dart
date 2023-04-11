import 'package:flutter/material.dart';

import '../../domain/entities/video.dart';
import '../pages/youtube_video_player.dart';

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
                  if (video.site.toLowerCase().contains('youtube')) {
                    Navigator.pushNamed(
                      context,
                      YoutubeVideoPlayer.routeName,
                      arguments: video.key,
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Video format not supported',
                          ),
                        ),
                      );
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_outline_rounded,
                        size: 30,
                        color: Colors.grey.shade500,
                      ),
                      if (video.name.isNotEmpty) ...[
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            video.name,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ],
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
