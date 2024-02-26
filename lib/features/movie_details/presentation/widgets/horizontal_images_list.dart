import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart';
import 'package:movie_browser/features/movie_details/presentation/widgets/movie_image.dart';

class HorizontalImagesList extends StatelessWidget {
  const HorizontalImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieImagesCubit, MovieImagesState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final images = state.images;
            if (images.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Images'),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
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
                            images: images,
                            index: index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
