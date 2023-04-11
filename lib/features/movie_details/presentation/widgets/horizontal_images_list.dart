import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/movie_details/presentation/cubits/video/video_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_video.dart';

import '../../domain/entities/video.dart';
import '../cubits/movie_images/movie_images_cubit.dart';
import 'movie_image.dart';

class HorizontalImagesList extends StatefulWidget {
  const HorizontalImagesList({super.key});

  @override
  State<HorizontalImagesList> createState() => _HorizontalImagesListState();
}

class _HorizontalImagesListState extends State<HorizontalImagesList> {
  List<Video> _videos = [];
  List<String> _images = [];

  @override
  void didChangeDependencies() {
    _videos = [];
    _images = [];

    context.watch<VideoCubit>().state.mapOrNull(
          loaded: (state) => _videos = state.videos.results,
        );

    context.watch<MovieImagesCubit>().state.mapOrNull(
          loaded: (state) => _images = state.images,
        );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final elements = [..._videos, ..._images];
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: elements.length,
        itemBuilder: (context, index) {
          if (elements[index] is String &&
              (elements[index] as String).isNotEmpty) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: MovieImage(
                images: _images,
                index: _images.indexOf(elements[index] as String),
              ),
            );
          } else if (elements[index] is Video) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: MovieVideo(video: elements[index] as Video),
            );
          }
          return const SizedBox();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
