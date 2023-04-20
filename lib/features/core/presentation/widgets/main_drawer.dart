import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../profile/presentation/cubits/user_profile/user_profile_cubit.dart';
import '../../../profile/presentation/pages/user_lists_page.dart';
import 'app_logo.dart';
import 'sign_in_button.dart';
import 'sign_out_button.dart';
import 'user_avatar.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppLogo(),
          Expanded(
            child: BlocBuilder<AuthBloc, AuthBlocState>(
              builder: (context, state) {
                return state.maybeMap(
                  authenticated: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            const SizedBox(height: 8),
                            InkWell(
                              // TODO go to details page
                              onTap: () {},
                              child: Row(
                                children: [
                                  const UserAvatar(
                                    radius: 30,
                                  ),
                                  Text(
                                    state.displayName ?? state.email ?? 'User',
                                    softWrap: true,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade900,
                              indent: 8,
                              endIndent: 8,
                            ),
                            DrawerItem(
                              onPressed: () => Navigator.popAndPushNamed(
                                context,
                                UserListPage.routeName,
                                arguments: ListType.favoriteMovies,
                              ),
                              iconData: Icons.favorite,
                              title: 'Favorites',
                            ),
                            DrawerItem(
                              onPressed: () => Navigator.popAndPushNamed(
                                context,
                                UserListPage.routeName,
                                arguments: ListType.watchlistMovies,
                              ),
                              iconData: Icons.check_box,
                              title: 'watchlist',
                            ),
                            DrawerItem(
                              onPressed: () => Navigator.popAndPushNamed(
                                context,
                                UserListPage.routeName,
                                arguments: ListType.watchedMovies,
                              ),
                              iconData: Icons.remove_red_eye,
                              title: 'Watched',
                            ),
                            DrawerItem(
                              onPressed: () => Navigator.popAndPushNamed(
                                context,
                                UserListPage.routeName,
                                arguments: ListType.ratedMovies,
                              ),
                              iconData: Icons.star,
                              title: 'Rated',
                            ),
                          ],
                        )),
                        Divider(
                          color: Colors.grey.shade900,
                          indent: 8,
                          endIndent: 8,
                        ),
                        const SignOutButton(),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 8,
                        ),
                      ],
                    );
                  },
                  // not signed in
                  orElse: () => const Center(
                    child: SignInButton(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final String title;
  const DrawerItem({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
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
