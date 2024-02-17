import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie_details/presentation/widgets/movie_details_loading_indicator.dart';
import '../cubits/person_details/person_details_cubit.dart';
import '../widgets/person_details_widget.dart';

class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) => PersonDetailsWidget(person: state.person),
          loading: (_) => const MovieDetailsLoadingIndicator(),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
