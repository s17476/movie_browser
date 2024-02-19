import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({super.key, required this.vodeoId});

  final String vodeoId;

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;

  @override
  void didChangeDependencies() {
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller!.loadVideoById(videoId: widget.vodeoId);

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
            appBar: AppBar(
              leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
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
