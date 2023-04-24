import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/cubits/apple_provider/apple_provider_cubit.dart';
import '../../../auth/presentation/cubits/email_provider/email_provider_cubit.dart';
import '../../../auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart';
import '../../../auth/presentation/cubits/google_provider/google_provider_cubit.dart';
import '../../utils/show_sign_in_snackbar.dart';

class SignInListener extends StatelessWidget {
  final Widget child;
  const SignInListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FacebookProviderCubit, FacebookProviderState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (failure) {
                if (failure.message.isNotEmpty) {
                  showSignInSnackbar(
                    context: context,
                    provider: 'Facebook',
                    errorMessage: failure.message,
                  );
                }
              },
              submitted: (_) => showSignInSnackbar(
                context: context,
                provider: 'Facebook',
              ),
            );
          },
        ),
        BlocListener<AppleProviderCubit, AppleProviderState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (failure) {
                if (failure.message.isNotEmpty) {
                  showSignInSnackbar(
                    context: context,
                    provider: 'Apple',
                    errorMessage: failure.message,
                  );
                }
              },
              submitted: (_) => showSignInSnackbar(
                context: context,
                provider: 'Apple',
              ),
            );
          },
        ),
        BlocListener<GoogleProviderCubit, GoogleProviderState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (failure) {
                if (failure.message.isNotEmpty) {
                  showSignInSnackbar(
                    context: context,
                    provider: 'Google',
                    errorMessage: failure.message,
                  );
                }
              },
              submitted: (_) => showSignInSnackbar(
                context: context,
                provider: 'Google',
              ),
            );
          },
        ),
        BlocListener<EmailProviderCubit, EmailProviderState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (failure) {
                if (failure.message.isNotEmpty) {
                  showSignInSnackbar(
                    context: context,
                    provider: 'Email',
                    errorMessage: failure.message,
                  );
                }
              },
              submitted: (_) => showSignInSnackbar(
                context: context,
                provider: 'Email',
              ),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
