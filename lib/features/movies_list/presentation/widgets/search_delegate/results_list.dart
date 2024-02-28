import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_browser/features/movies_list/presentation/cubits/search_movies/search_movies_cubit.dart';
import 'package:movie_browser/features/movies_list/presentation/widgets/search_delegate/movie_list_tile.dart';

class ResultsList extends StatefulWidget {
  const ResultsList({super.key});

  @override
  State<ResultsList> createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  late final ScrollController _scrollController;

  Future<void> _loadNextResultsPage() async {
    if (_scrollController.position.extentAfter < 500) {
      final searchCubit = context.read<SearchMoviesCubit>();
      searchCubit.state.mapOrNull(
        loaded: (state) {
          if (!state.isLoadingNextPage) {
            searchCubit.loadNextresultsPage();
          }
        },
      );
    }
  }

  void _showResultInfo(BuildContext context, int totalResults) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            '$totalResults results found',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_loadNextResultsPage);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchMoviesCubit, SearchMoviesState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (state) {
            if (!state.isLoadingNextPage && state.movieList.page == 1) {
              _showResultInfo(context, state.movieList.totalResults);
            }
          },
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loading: (_) => Center(
            child: Image.asset(
              'assets/images/loading.gif',
              height: 90,
              width: 90,
            ),
          ),
          loaded: (state) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // results list
                ListView.separated(
                  controller: _scrollController,
                  itemCount: state.movieList.results.length,
                  itemBuilder: (context, index) => MovieListTile(
                    movie: state.movieList.results[index],
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade800,
                  ),
                ),
                // next page loading indicator
                if (state.isLoadingNextPage)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Image.asset(
                      'assets/images/loading.gif',
                      height: 90,
                      width: 90,
                    ),
                  )
              ],
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
