import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/app/custom_router.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/people/presentation/cubits/person_details/person_details_cubit.dart';

void fetchAndShowPerson(
  BuildContext context,
  int personId,
) {
  context.read<PersonDetailsCubit>().fetchPersonDetails(personId);

  CustomRouter.go(context, Routes.personDetails);
}
