import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../core/presentation/widgets/user_avatar.dart';
import '../../../core/utils/show_snack_bar.dart';
import '../../utils/show_delete_account_dialog.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  static const routeName = '/user-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            state.mapOrNull(
              authenticated: (state) {
                if (state.errorMessage != null) {
                  showSnackBar(context: context, message: state.errorMessage!);
                }
              },
              initial: (_) => Navigator.pop(context),
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              authenticated: (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserAvatar(radius: MediaQuery.of(context).size.width * 0.25),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  if (state.displayName != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name'),
                        Text(state.displayName!),
                      ],
                    ),
                    const SizedBox(height: 16)
                  ],
                  if (state.email != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email'),
                        Text(state.email!),
                      ],
                    ),
                    const SizedBox(height: 16)
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sign in method'),
                      Text(state.providerId[0].providerId)
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      thickness: 1.5,
                    ),
                  ),
                  TextButton(
                    onPressed: () => showDeleteAccountDialog(context: context),
                    child: const Text('Delete account'),
                  ),
                ],
              ),
              submitting: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => const Center(
                child: Text('Error occurred'),
              ),
            );
          },
        ),
      ),
    );
  }
}
