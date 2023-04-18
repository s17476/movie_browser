import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../utils/fetch_and_show_movie.dart';
import '../../utils/fetch_and_show_tv_show.dart';

class Poster extends StatelessWidget {
  final int id;
  final String posterPath;
  final bool shouldReplacePage;
  final bool isTvShow;
  const Poster({
    Key? key,
    required this.id,
    required this.posterPath,
    this.shouldReplacePage = false,
    this.isTvShow = false,
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
            FadeInImage(
              imageErrorBuilder: (context, error, stackTrace) => const Center(
                child: Text(
                  'No image found',
                  textAlign: TextAlign.center,
                ),
              ),
              placeholder: const AssetImage('assets/images/loading.gif'),
              placeholderFit: BoxFit.scaleDown,
              image: CachedNetworkImageProvider(
                '${kImagesBaseUrl}w154$posterPath',
              ),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isTvShow
                    ? () => fetchAndShowTvShow(context, id, shouldReplacePage)
                    : () => fetchAndShowMovie(context, id, shouldReplacePage),
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
