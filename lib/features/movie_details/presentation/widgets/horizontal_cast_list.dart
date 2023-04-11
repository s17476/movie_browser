import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/Cast/cast_cubit.dart';
import 'actor_card.dart';

class HorizontalCastList extends StatelessWidget {
  const HorizontalCastList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final cast = state.credits.cast;

            if (cast.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Cast'),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: cast.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ActorCard(actor: cast[index]),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
