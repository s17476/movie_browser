import 'package:flutter/material.dart';

import 'package:movie_browser/features/core/constants/constants.dart';
import 'package:movie_browser/features/people/domain/entities/person_details.dart';
import 'package:movie_browser/features/people/presentation/widgets/person_movies_list.dart';

class PersonDetailsWidget extends StatelessWidget {
  final PersonDetails person;

  const PersonDetailsWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
              Shadow(color: Colors.black, blurRadius: 40),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 320,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Container(
                        key: UniqueKey(),
                        margin: const EdgeInsets.only(left: 8),
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: AspectRatio(
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
                                FadeInImage.assetNetwork(
                                  imageErrorBuilder:
                                      (context, error, stackTrace) =>
                                          const Center(
                                    child: Text(
                                      'No image found',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  placeholder: 'assets/images/loading.gif',
                                  placeholderFit: BoxFit.scaleDown,
                                  placeholderScale: 2,
                                  image:
                                      '${kImagesBaseUrl}w500${person.profilePath}',
                                  fit: BoxFit.fitHeight,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // description
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.top + 330,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    person.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  if (person.birthday != null)
                                    Column(
                                      children: [
                                        const Text(
                                          'Date of birth',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(person.birthday!),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 12,
              ),
              child: Text(
                person.biography,
                textAlign: TextAlign.justify,
              ),
            ),
            const PersonMoviesList(),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
