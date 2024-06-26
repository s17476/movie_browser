import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_browser/features/movie_details/domain/entities/tv_show_details.dart';
import 'package:movie_browser/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movie_browser/features/profile/domain/entities/user_profile.dart';
import 'package:movie_browser/features/profile/presentation/cubits/user_profile/user_profile_cubit.dart';

part 'user_lists_cubit.freezed.dart';
part 'user_lists_state.dart';

@singleton
class UserListsCubit extends Cubit<UserListsState> {
  final UserProfileCubit userProfileCubit;
  final MovieDetailsRepository movieDetailsRepository;

  late StreamSubscription _streamSubscription;

  UserListsCubit(
    this.userProfileCubit,
    this.movieDetailsRepository,
  ) : super(const UserListsState.initial()) {
    _streamSubscription = userProfileCubit.stream.listen((userState) {
      state.mapOrNull(
        loaded: (userState) {
          state.mapOrNull(
            loaded: (state) {
              return fetchData(listType: state.listType);
            },
          );
        },
      );
    });
  }

  Future<void> fetchData({
    required ListType listType,
  }) async {
    await userProfileCubit.state.mapOrNull(
      loaded: (userState) async {
        emit(const UserListsState.loading());

        bool error = false;

        List<MovieDetails> moviesDetails = [];

        for (var movie in _getMovies(userState.userProfile, listType)) {
          final failureOrMovieDetails =
              await movieDetailsRepository.fetchMovieDetails(movie);
          await failureOrMovieDetails.fold(
            (_) async => error = true,
            (movieDetails) async {
              moviesDetails.add(movieDetails);
              emit(
                UserListsState.loaded(
                  movies: [...moviesDetails],
                  shows: [],
                  listType: listType,
                ),
              );
            },
          );
        }

        List<TvShowDetails> tvShowsDetails = [];
        for (var tvShow in _getTvShows(userState.userProfile, listType)) {
          final failureOrTvShowDetails =
              await movieDetailsRepository.fetchTvShowDetails(tvShow);
          await failureOrTvShowDetails.fold(
            (_) async => error = true,
            (tvShowDetails) async {
              tvShowsDetails.add(tvShowDetails);
              emit(
                UserListsState.loaded(
                  movies: moviesDetails,
                  shows: [...tvShowsDetails],
                  listType: listType,
                ),
              );
            },
          );
        }

        if (!error && moviesDetails.isEmpty && tvShowsDetails.isEmpty) {
          emit(
            UserListsState.loaded(
              listType: listType,
              movies: [],
              shows: [],
            ),
          );
        }
        if (error && moviesDetails.isEmpty && tvShowsDetails.isEmpty) {
          emit(const UserListsState.error());
        }
      },
    );
  }

  List<int> _getMovies(UserProfile userProfile, ListType listType) {
    switch (listType) {
      case ListType.favoriteMovies:
        return userProfile.favoriteMovies;
      case ListType.ratedMovies:
        return userProfile.ratedMovies;
      case ListType.watchedMovies:
        return userProfile.watchedMovies;
      case ListType.watchlistMovies:
        return userProfile.toWatchMovies;
      default:
        return [];
    }
  }

  List<int> _getTvShows(UserProfile userProfile, ListType listType) {
    switch (listType) {
      case ListType.favoriteMovies:
        return userProfile.favoriteTvShows;
      case ListType.ratedMovies:
        return userProfile.ratedTvShows;
      case ListType.watchedMovies:
        return userProfile.watchedShows;
      case ListType.watchlistMovies:
        return userProfile.toWatchShows;
      default:
        return [];
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
