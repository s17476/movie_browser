import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class SuggestionTile extends StatelessWidget {
  final Movie movie;
  final Function(BuildContext, String) search;

  const SuggestionTile({
    Key? key,
    required this.movie,
    required this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        movie.title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
      ),
      onTap: () => search(context, movie.title),
    );
  }
}
