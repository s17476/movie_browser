import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../core/presentation/widgets/glass_layer.dart';

Future<dynamic> showDeleteAccountDialog({
  required BuildContext context,
}) {
  final formKey = GlobalKey<FormState>();
  bool isEmailProvider = false;
  final authState = context.read<AuthBloc>().state;
  authState.mapOrNull(
    authenticated: (authState) {
      isEmailProvider = authState.providerId[0].providerId == 'password';
    },
  );
  String? answer;
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => StatefulBuilder(builder: (context, setInnerState) {
      return Material(
        color: Colors.transparent,
        child: GlassLayer(
          onDismiss: () => Navigator.pop(context),
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text('Delete user account'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEmailProvider
                      ? 'To confirm the deletion of your user account, please enter your password below.'
                      : 'Confirm the deletion',
                ),
                if (isEmailProvider) ...[
                  const SizedBox(
                    height: 4,
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      onChanged: (value) {
                        answer = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        errorMaxLines: 5,
                        hintText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ]
              ],
            ),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
                onPressed: () {
                  if (!isEmailProvider) {
                    context
                        .read<AuthBloc>()
                        .add(const AuthBlocEvent.deleteUser());
                    Navigator.pop(context, true);
                  } else if (formKey.currentState!.validate()) {
                    context
                        .read<AuthBloc>()
                        .add(AuthBlocEvent.deleteUser(password: answer));
                    Navigator.pop(context, true);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }),
  );
}
