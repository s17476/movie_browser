import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/widgets/glass_layer.dart';
import '../../profile/presentation/cubits/user_profile/user_profile_cubit.dart';

void showrateDialog(BuildContext context, ListType listType, int movieId) {
  int value = 2;

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
          title: const Center(child: Text('Rate movie')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatefulBuilder(builder: (context, setInnerState) {
                final int stars = value ~/ 2;
                final int emptyStars = 5 - stars;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < stars; i++)
                      IconButton(
                        onPressed: () =>
                            setInnerState(() => value = (i + 1) * 2),
                        icon: const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 40,
                        ),
                      ),
                    for (int i = 0; i < emptyStars; i++)
                      IconButton(
                        onPressed: () =>
                            setInnerState(() => value = (stars + 1 + i) * 2),
                        icon: const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                          size: 40,
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<UserProfileCubit>()
                    .rate(listType: listType, movieId: movieId, value: value);
                Navigator.pop(context);
              },
              child: const Text(
                'Rate!',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
