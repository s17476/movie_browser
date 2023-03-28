import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie_list.dart';
import 'package:movie_browser/features/movies_list/domain/repositories/movies_repository.dart';

part 'top20_movie_list_cubit.freezed.dart';
part 'top20_movie_list_state.dart';

@singleton
class Top20MovieListCubit extends Cubit<Top20MovieListState> {
  final MoviesRepository moviesRepository;
  Top20MovieListCubit(
    this.moviesRepository,
  ) : super(const Top20MovieListState.initial()) {
    fetchTop20Movies();
  }

  // fetches twenty most popular movies
  Future<void> fetchTop20Movies() async {
    emit(const Top20MovieListState.loading());

    final failureOrMovieList = await moviesRepository.top20Movies();

    await failureOrMovieList.fold(
      (failure) async {
        emit(const Top20MovieListState.error());
      },
      (movieList) async =>
          emit(Top20MovieListState.loaded(movieList: movieList)),
    );
  }
}
