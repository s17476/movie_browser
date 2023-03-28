import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';
import 'package:movie_browser/injection.dart';

import '../features/movies_list/presentation/pages/home_page.dart';

class MovieBrowser extends StatelessWidget {
  const MovieBrowser({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<Top20MovieListCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(
            // useMaterial3: true,
            ),
        home: const HomePage(),
      ),
    );
  }
}
