import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class CustomSigninButton extends StatelessWidget {
  final ButtonType buttonType;
  final String route;

  const CustomSigninButton({
    Key? key,
    required this.buttonType,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonType: buttonType,
      onPressed: () => Navigator.popAndPushNamed(
        context,
        route,
      ),
    );
  }
}
