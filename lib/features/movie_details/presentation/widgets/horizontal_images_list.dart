import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/movie_images/movie_images_cubit.dart';
import 'movie_image.dart';

class HorizontalImagesList extends StatelessWidget {
  const HorizontalImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieImagesCubit, MovieImagesState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            return SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  if (state.images[index].isNotEmpty) {
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
                        images: state.images,
                        index: index,
                      ),
                    );
                  }
                  return const SizedBox();
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
