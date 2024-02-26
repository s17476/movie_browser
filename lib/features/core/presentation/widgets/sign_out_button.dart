import 'package:flutter/material.dart';

import 'package:movie_browser/features/auth/utils/show_signout_dialog.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
        showSignoutDialog(context: context);
      },
      child: Row(
        children: [
          const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Sign out',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
