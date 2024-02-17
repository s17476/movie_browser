import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../people/utils/fetch_and_show_person.dart';
import '../../domain/entities/actor.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;
  const ActorCard({
    Key? key,
    required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.53,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          alignment: Alignment.bottomCenter,
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
              image: '${kImagesBaseUrl}w154${actor.profilePath}',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        actor.character,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, shadows: [
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                          Shadow(color: Colors.black, blurRadius: 10),
                        ]),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 42,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      actor.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => fetchAndShowPerson(context, actor.id),
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
