import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  final String description;
  const MovieDescription({
    Key? key,
    required this.description,
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
          duration: Duration(milliseconds: _isExpanded ? 300 : 100),
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 0,
            ),
            width: double.infinity,
            height: _isExpanded ? null : 32,
            child: Text(
              widget.description,
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
