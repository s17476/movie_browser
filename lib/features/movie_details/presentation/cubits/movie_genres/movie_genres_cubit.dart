import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_genre_list.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';

part 'movie_genres_cubit.freezed.dart';
part 'movie_genres_state.dart';

@singleton
class MovieGenresCubit extends Cubit<MovieGenresState> {
  final MovieDetailsRepository repository;
  MovieGenresCubit(
    this.repository,
  ) : super(const MovieGenresState.initial()) {
    fetchMovieGeneres();
  }

  Future<void> fetchMovieGeneres() async {
    emit(const MovieGenresState.loading());
    final failureOrMovieGeneres = await repository.fetchMovieGenres();
    await failureOrMovieGeneres.fold(
      (_) async => emit(const MovieGenresState.error()),
      (genres) async => emit(MovieGenresState.loaded(genreList: genres)),
    );
  }
}
