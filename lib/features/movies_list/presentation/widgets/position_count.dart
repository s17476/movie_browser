import 'package:flutter/material.dart';

class PositionCount extends StatelessWidget {
  final int index;
  const PositionCount({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '#${index + 1}',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
