import 'package:flutter/material.dart';

import '../../domain/entities/movie_details.dart';

class MovieDescription extends StatefulWidget {
  final MovieDetails movie;
  const MovieDescription({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  bool _isExpanded = false;

  _toggleIsExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 0,
            ),
            width: double.infinity,
            height: _isExpanded ? null : 32,
            child: Text(
              widget.movie.overview,
              textAlign: TextAlign.justify,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        TextButton(
          onPressed: _toggleIsExpanded,
          style: TextButton.styleFrom(
            visualDensity: VisualDensity.compact,
            foregroundColor: _isExpanded ? Colors.grey : Colors.amber,
          ),
          child: Text(
            _isExpanded ? 'Show less' : 'Show more',
          ),
        ),
      ],
    );
  }
}
