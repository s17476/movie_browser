import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:movie_browser/features/movie_details/presentation/cubits/movie_genres/movie_genres_cubit.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';
import 'package:movie_browser/features/movies_list/presentation/cubits/category_movies/category_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/poster.dart';

class GenreWidget extends StatefulWidget {
  final int genreId;
  final List<Movie> movies;
  const GenreWidget({
    Key? key,
    required this.genreId,
    required this.movies,
  }) : super(key: key);

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  late final ScrollController _scrollController;

  Future<void> _loadNextResultsPage() async {
    if (_scrollController.position.extentAfter < 500) {
      final categoryCubit = context.read<CategoryMoviesCubit>();
      categoryCubit.state.mapOrNull(
        loaded: (state) {
          if (!state.isLoadingNextPage) {
            categoryCubit.loadNextResultsPage();
          }
        },
      );
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_loadNextResultsPage);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.watch<CategoryMoviesCubit>().state.mapOrNull(
      loaded: (state) {
        if (ResponsiveWrapper.of(context).isLargerThan(MOBILE) &&
            state.movieList.page == 1) {
          final categoryCubit = context.read<CategoryMoviesCubit>();
          categoryCubit.state.mapOrNull(
            loaded: (state) {
              if (!state.isLoadingNextPage) {
                categoryCubit.loadNextResultsPage();
              }
            },
          );
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: BlocBuilder<MovieGenresCubit, MovieGenresState>(
          builder: (context, state) {
            String title = '';
            state.mapOrNull(
              loaded: (state) {
                title = state.getGenreNameById(widget.genreId) ?? '';
              },
            );
            return Text(title);
          },
        ),
      ),
      body: GridView.count(
        controller: _scrollController,
        crossAxisCount:
            ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 3 : 5,
        childAspectRatio: 2 / 3,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight + 8,
          left: 8,
          right: 8,
          bottom: 70,
        ),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: widget.movies
            .map((e) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Poster(
                    id: e.id,
                    posterPath: e.posterPath,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
