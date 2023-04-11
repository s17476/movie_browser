import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie_details.dart';
import '../../../domain/repositories/movie_details_repository.dart';

part 'movie_details_cubit.freezed.dart';
part 'movie_details_state.dart';

@singleton
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepository _repository;
  MovieDetailsCubit(
    this._repository,
  ) : super(const MovieDetailsState.initial());

  Future<void> fetchMovieDetails(int movieId) async {
    emit(const MovieDetailsState.loading());
    final failureOrMovieDetails = await _repository.fetchMovieDetails(movieId);
    await failureOrMovieDetails.fold(
      (_) async => emit(const MovieDetailsState.error()),
      (movieDetails) async => emit(
        MovieDetailsState.loaded(
          id: movieId,
          movie: movieDetails,
        ),
      ),
    );
  }
}
