import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_button/sign_button.dart';

import '../../../app/routes.dart';
import '../../core/presentation/widgets/glass_layer.dart';
import '../presentation/cubits/apple_provider/apple_provider_cubit.dart';
import '../presentation/cubits/facebook_provider/facebook_provider_cubit.dart';
import '../presentation/cubits/google_provider/google_provider_cubit.dart';
import '../presentation/widgets/custom_signin_button.dart';

void showAuthProvidersDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => Material(
      color: Colors.transparent,
      child: GlassLayer(
        onDismiss: () => Navigator.pop(context),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Center(child: Text('Signin / Signup')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomSigninButton(
                buttonType: ButtonType.mail,
                route: Routes.emailAuthPage,
              ),
              const Divider(),
              if (Platform.isIOS)
                SignInButton(
                  buttonType: ButtonType.apple,
                  onPressed: () {
                    context.read<AppleProviderCubit>().signIn();
                    Navigator.pop(context);
                  },
                ),
              const SizedBox(
                height: 4,
              ),
              SignInButton(
                buttonType: ButtonType.google,
                onPressed: () {
                  context.read<GoogleProviderCubit>().signIn();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 4,
              ),
              SignInButton(
                buttonType: ButtonType.facebook,
                width: double.infinity,
                onPressed: () {
                  context.read<FacebookProviderCubit>().signIn();
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              // cancel button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
