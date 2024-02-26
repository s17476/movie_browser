import 'package:flutter/material.dart';

import 'package:movie_browser/features/auth/utils/show_auth_providers_dialog.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.pop(context);
        showAuthProvidersDialog(context);
      },
      icon: const Icon(
        Icons.person,
        size: 30,
        color: Colors.black,
      ),
      label: Text(
        'Sign in',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.black),
      ),
    );
  }
}
