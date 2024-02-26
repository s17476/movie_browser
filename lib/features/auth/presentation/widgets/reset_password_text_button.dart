import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_browser/features/auth/presentation/cubits/email_provider/email_provider_cubit.dart';

class ResetPasswordTextButton extends StatelessWidget {
  const ResetPasswordTextButton({
    Key? key,
    required Animation<Offset>? slideAnimation,
  })  : _slideAnimation = slideAnimation,
        super(key: key);

  final Animation<Offset>? _slideAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation!,
      child: TextButton(
        onPressed: () {
          final textEditingController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Reset your password'),
              content: TextFormField(
                controller: textEditingController,
                key: const ValueKey('password-reset'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  floatingLabelStyle: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                  labelText: 'E-mail',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: context.pop,
                  child: const Text('Cancel'),
                ),
                TextButton(
                  child: Text(
                    'Reset password',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<EmailProviderCubit>()
                        .resetPassword(textEditingController.text);
                    context.pop();
                  },
                ),
              ],
            ),
          );
        },
        child: const Text('I don\'t remember my password'),
      ),
    );
  }
}
