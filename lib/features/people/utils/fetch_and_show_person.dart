import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/cubits/person_details/person_details_cubit.dart';
import '../presentation/pages/person_details_page.dart';

void fetchAndShowPerson(
  BuildContext context,
  int personId, [
  bool shouldReplacePage = false,
]) {
  context.read<PersonDetailsCubit>().fetchPersonDetails(personId);
  if (shouldReplacePage) {
    Navigator.pushReplacementNamed(context, PersonDetailsPage.routeName);
  } else {
    Navigator.pushNamed(context, PersonDetailsPage.routeName);
  }
}
