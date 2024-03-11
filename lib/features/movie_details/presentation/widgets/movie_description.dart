import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  final String description;
  const MovieDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
