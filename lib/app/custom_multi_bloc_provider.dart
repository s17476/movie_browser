import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/movie_details/presentation/cubits/cast/cast_cubit.dart';
import '../features/movie_details/presentation/cubits/movie_details/movie_details_cubit.dart';
import '../features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';
import '../features/movie_details/presentation/cubits/movie_images/movie_images_cubit.dart';
import '../features/movie_details/presentation/cubits/recommendations/recommendations_cubit.dart';
import '../features/movie_details/presentation/cubits/top5_movies/top20_movies_cubit.dart';
import '../features/movie_details/presentation/cubits/tv_show_details/tv_show_details_cubit.dart';
import '../features/movie_details/presentation/cubits/video/video_cubit.dart';
import '../features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart';
import '../features/movies_list/presentation/cubits/random_genres/random_genres_cubit.dart';
import '../features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart';
import '../features/movies_list/presentation/cubits/search_suggestions/search_suggestions_cubit.dart';
import '../features/movies_list/presentation/cubits/top20_movie_list/top20_movie_list_cubit.dart';
import '../features/movies_list/presentation/cubits/top20_tv_shows_list/top20_tv_shows_list_cubit.dart';
import '../features/people/presentation/cubits/person_credits/person_credits_cubit.dart';
import '../features/people/presentation/cubits/person_details/person_details_cubit.dart';
import '../injection.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  final Widget child;
  const CustomMultiBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<Top20MovieListCubit>()),
        BlocProvider(create: (context) => getIt<Top20TvShowsListCubit>()),
        BlocProvider(create: (context) => getIt<Top20MoviesCubit>()),
        BlocProvider(create: (context) => getIt<MovieGenresCubit>()),
        BlocProvider(create: (context) => getIt<RandomGenresCubit>()),
        BlocProvider(create: (context) => getIt<SearchSuggestionsCubit>()),
        BlocProvider(create: (context) => getIt<SearchMoviesCubit>()),
        BlocProvider(create: (context) => getIt<MovieDetailsCubit>()),
        BlocProvider(create: (context) => getIt<MovieImagesCubit>()),
        BlocProvider(create: (context) => getIt<VideoCubit>()),
        BlocProvider(create: (context) => getIt<CastCubit>()),
        BlocProvider(create: (context) => getIt<RecommendationsCubit>()),
        BlocProvider(create: (context) => getIt<PersonDetailsCubit>()),
        BlocProvider(create: (context) => getIt<PersonCreditsCubit>()),
        BlocProvider(create: (context) => getIt<CategoryMoviesCubit>()),
        BlocProvider(create: (context) => getIt<TvShowDetailsCubit>()),
      ],
      child: child,
    );
  }
}
