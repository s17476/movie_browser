import 'package:flutter/material.dart';

class MovieSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new),
      );

  @override
  Widget buildResults(BuildContext context) => const SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) => Column(
        children: [
          const Text('sugest'),
          const Text('sugest'),
          const Text('sugest'),
          InkWell(
            onTap: () {
              query = 'xxxxxx';
              showResults(context);
            },
            child: const Text('sugest'),
          ),
        ],
      );
}
