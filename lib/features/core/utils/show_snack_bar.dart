import 'package:flutter/material.dart';

/// shows SnackBar
///
/// 'message' argument is SnackBar's content
/// 'isErrorMessage' argument defines background color
/// true - primary color
/// false - error color
void showSnackBar({
  required BuildContext context,
  required String message,
  bool isErrorMessage = false,
}) async {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: SizedBox(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ),
        backgroundColor: isErrorMessage
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        duration: Duration(seconds: isErrorMessage ? 3 : 1),
      ),
    );
}
