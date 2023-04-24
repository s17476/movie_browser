import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

import '../../../domain/entities/tv_show_list.dart';

part 'top20_tv_shows_list_cubit.freezed.dart';
part 'top20_tv_shows_list_state.dart';

@singleton
class Top20TvShowsListCubit extends Cubit<Top20TvShowsListState> {
  final MoviesRepository _moviesRepository;
  Top20TvShowsListCubit(
    this._moviesRepository,
  ) : super(const Top20TvShowsListState.initial()) {
    fetchTop20TvShows();
  }

  // fetches twenty most popular movies
  Future<void> fetchTop20TvShows() async {
    emit(const Top20TvShowsListState.loading());

    final failureOrMovieList = await _moviesRepository.top20TvShows();

    await failureOrMovieList.fold(
      (failure) async {
        emit(const Top20TvShowsListState.error());
      },
      (movieList) async =>
          emit(Top20TvShowsListState.loaded(showsList: movieList)),
    );
  }
}
