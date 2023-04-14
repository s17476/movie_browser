import 'dart:ui';

import 'package:flutter/material.dart';

class GlassLayer extends StatelessWidget {
  const GlassLayer({Key? key, required this.onDismiss, required this.child})
      : super(key: key);

  final Widget child;
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0.0, end: 1),
      child: child,
      builder: (context, double value, child) {
        return InkWell(
          onTap: () => onDismiss(),
          child: Opacity(
            opacity: value,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0,
                sigmaY: 15.0,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
