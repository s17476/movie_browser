import 'package:flutter/material.dart';

import 'show_snack_bar.dart';

void showSignInSnackbar({
  required BuildContext context,
  required String provider,
  String? errorMessage,
}) {
  final message = errorMessage == null
      ? 'You are successfully signed in with $provider'
      : 'Error occurred while sign in using $provider. Error message: $errorMessage';
  showSnackBar(
    context: context,
    message: message,
    isErrorMessage: errorMessage != null,
  );
}
