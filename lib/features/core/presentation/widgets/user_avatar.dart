import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;
  final EdgeInsetsGeometry padding;
  const UserAvatar({
    Key? key,
    this.radius,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocState>(
      builder: (context, state) {
        return state.maybeMap(
          authenticated: (state) {
            final imageProvider = state.photoUrl != null
                ? CachedNetworkImageProvider(state.photoUrl!) as ImageProvider
                : const AssetImage('assets/images.user.png');

            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: padding,
                child: CircleAvatar(
                  radius: radius,
                  backgroundImage: imageProvider,
                ),
              ),
            );
          },
          orElse: () => const MenuButton(),
        );
      },
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
