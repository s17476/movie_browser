import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../movie_details/domain/entities/movie_details.dart';
import '../../../../movie_details/domain/entities/tv_show_details.dart';
import '../../../../movie_details/domain/repositories/movie_details_repository.dart';

part 'user_lists_cubit.freezed.dart';
part 'user_lists_state.dart';

@injectable
class UserListsCubit extends Cubit<UserListsState> {
  final MovieDetailsRepository _movieDetailsRepository;
  UserListsCubit(
    this._movieDetailsRepository,
  ) : super(const UserListsState.initial());

  Future<void> fetchData({
    required List<int> movies,
    required List<int> tvShows,
  }) async {
    emit(const UserListsState.loading());

    bool error = false;

    List<MovieDetails> moviesDetails = [];
    for (var movie in movies) {
      final failureOrMovieDetails =
          await _movieDetailsRepository.fetchMovieDetails(movie);
      await failureOrMovieDetails.fold(
        (_) async => error = true,
        (movieDetails) async => moviesDetails.add(movieDetails),
      );
    }

    List<TvShowDetails> tvShowsDetails = [];
    for (var tvShow in tvShows) {
      final failureOrTvShowDetails =
          await _movieDetailsRepository.fetchTvShowDetails(tvShow);
      await failureOrTvShowDetails.fold(
        (_) async => error = true,
        (tvShowDetails) async => tvShowsDetails.add(tvShowDetails),
      );
    }

    if (error && moviesDetails.isEmpty && tvShowsDetails.isEmpty) {
      emit(const UserListsState.error());
    } else {
      emit(UserListsState.loaded(movies: moviesDetails, shows: tvShowsDetails));
    }
  }
}
