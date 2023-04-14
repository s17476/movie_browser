import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/glass_layer.dart';
import '../presentation/blocs/bloc/auth_bloc.dart';

Future<dynamic> showSignoutDialog({
  required BuildContext context,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => Material(
      color: Colors.transparent,
      child: GlassLayer(
        onDismiss: () => Navigator.pop(context),
        child: AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Signout'),
          content: const Text('Are you sure you want to signout?'),
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
                context.read<AuthBloc>().add(const AuthBlocEvent.signOut());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
