import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({super.key});

  static const routeName = '/yt-player';

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;

  @override
  void didChangeDependencies() {
    final videoId = ModalRoute.of(context)?.settings.arguments;
    if (videoId != null && videoId is String) {
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          mute: false,
          showFullscreenButton: true,
          loop: false,
        ),
      );
      _controller!.loadVideoById(videoId: videoId);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      return YoutubePlayerScaffold(
        backgroundColor: Colors.transparent,
        autoFullScreen: true,
        aspectRatio: 16 / 9,
        controller: _controller!,
        builder: (context, player) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(),
            body: Center(
              child: player,
            ),
          );
        },
      );
    }
    return const SizedBox();
  }
}
