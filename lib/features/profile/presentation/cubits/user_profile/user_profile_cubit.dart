import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../domain/repositories/profile_repository.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

enum ListType {
  favoriteMovies,
  favoriteShows,
  watchlistMovies,
  watchlistShows,
  watchedMovies,
  watchedShows,
  ratedMovies,
  ratedShows;

  String toJson() => name.toString();

  static ListType fromJson(String json) => values.byName(json);
}

@singleton
class UserProfileCubit extends Cubit<UserProfileState> {
  final ProfileRepository _repository;
  final AuthBloc _authBloc;
  late StreamSubscription _streamSubscription;
  UserProfileCubit(
    this._repository,
    this._authBloc,
  ) : super(const UserProfileState.initial()) {
    _streamSubscription = _authBloc.stream.listen((state) {
      state.maybeMap(
        authenticated: (state) => fetchUserProfile(state.userId),
        orElse: () => _reset(),
      );
    });
  }

  Future<void> rate({
    required ListType listType,
    required int movieId,
    required int value,
  }) async {
    if (listType == ListType.ratedMovies || listType == ListType.ratedShows) {
      await state.mapOrNull(
        loaded: (state) async {
          final oldState = state;
          final updatedUserProfile = _addToUser(
            userProfile: state.userProfile,
            listType: listType,
            movieId: movieId,
          );

          emit(
            UserProfileState.loaded(
              userProfile: updatedUserProfile,
              isError: false,
            ),
          );

          final failureOrUnit =
              await _repository.updateUserProfile(updatedUserProfile);
          await failureOrUnit.fold(
            (_) async => emit(oldState.copyWith(isError: true)),
            (_) async {
              if (listType == ListType.ratedMovies) {
                await _repository.rateMovie(
                  movieId,
                  state.userProfile.sessionId,
                  value,
                );
              } else {
                await _repository.rateTvShow(
                  movieId,
                  state.userProfile.sessionId,
                  value,
                );
              }
            },
          );
        },
      );
    }
  }

  Future<void> addMovieTo({
    required ListType listType,
    required int movieId,
  }) async {
    if (listType != ListType.ratedMovies || listType != ListType.ratedShows) {
      await state.mapOrNull(
        loaded: (state) async {
          final oldState = state;
          final updatedUserProfile = _addToUser(
            userProfile: state.userProfile,
            listType: listType,
            movieId: movieId,
          );

          emit(
            UserProfileState.loaded(
              userProfile: updatedUserProfile,
              isError: false,
            ),
          );

          final failureOrUnit =
              await _repository.updateUserProfile(updatedUserProfile);
          await failureOrUnit.fold(
            (_) async => emit(oldState.copyWith(isError: true)),
            (_) async => null,
          );
        },
      );
    }
  }

  Future<void> removeMovieFrom({
    required ListType listType,
    required int movieId,
  }) async {
    await state.mapOrNull(
      loaded: (state) async {
        final oldState = state;
        final updatedUserProfile = _removeFromUser(
          userProfile: state.userProfile,
          listType: listType,
          movieId: movieId,
        );

        emit(
          UserProfileState.loaded(
            userProfile: updatedUserProfile,
            isError: false,
          ),
        );

        final failureOrUnit =
            await _repository.updateUserProfile(updatedUserProfile);
        await failureOrUnit.fold(
          (_) async => emit(oldState.copyWith(isError: true)),
          (_) async => null,
        );
      },
    );
  }

  Future<void> deleteUserProfile() async {
    await state.mapOrNull(
      loaded: (state) async {
        final failureOrUnit =
            await _repository.deleteUserProfile(state.userProfile.id);
        await failureOrUnit.fold(
          (_) async => emit(state.copyWith(isError: true)),
          (_) async => emit(const UserProfileState.initial()),
        );
      },
    );
  }

  Future<void> fetchUserProfile(String userId) async {
    emit(const UserProfileState.loading());

    final failureOrUserProfile = await _repository.fetchUserProfile(userId);
    await failureOrUserProfile.fold(
      (failure) async => await failure.maybeMap(
        // first log in
        userNotFound: (_) async => await _createNewUser(userId),
        // database or connection error
        orElse: () async => emit(const UserProfileState.error()),
      ),
      (userProfile) async => emit(
        UserProfileState.loaded(userProfile: userProfile, isError: false),
      ),
    );
  }

  Future<void> _createNewUser(String userId) async {
    // create The Movie DB guest session
    final failureOrSessionId = await _repository.createGuestSession();
    await failureOrSessionId.fold(
      (_) async => emit(const UserProfileState.error()),
      (sessionId) async {
        // create new user in the DB
        final userProfile =
            UserProfile.newUser(userId).copyWith(sessionId: sessionId);
        final failureOrUnit = await _repository.createUserProfile(userProfile);
        await failureOrUnit.fold(
          (_) async => emit(const UserProfileState.error()),
          (_) async => emit(
            UserProfileState.loaded(userProfile: userProfile, isError: false),
          ),
        );
      },
    );
  }

  Future<void> _reset() async {
    emit(const UserProfileState.initial());
  }

  UserProfile _addToUser({
    required UserProfile userProfile,
    required ListType listType,
    required int movieId,
  }) {
    switch (listType) {
      case ListType.favoriteMovies:
        return userProfile.copyWith(
          favoriteMovies: [...userProfile.favoriteMovies, movieId],
        );
      case ListType.favoriteShows:
        return userProfile.copyWith(
          favoriteTvShows: [...userProfile.favoriteTvShows, movieId],
        );
      case ListType.ratedMovies:
        return userProfile.copyWith(
          ratedMovies: [...userProfile.ratedMovies, movieId],
        );
      case ListType.ratedShows:
        return userProfile.copyWith(
          ratedTvShows: [...userProfile.ratedTvShows, movieId],
        );
      case ListType.watchedMovies:
        return userProfile.copyWith(
          watchedMovies: [...userProfile.watchedMovies, movieId],
        );
      case ListType.watchedShows:
        return userProfile.copyWith(
          watchedShows: [...userProfile.watchedShows, movieId],
        );
      case ListType.watchlistMovies:
        return userProfile.copyWith(
          toWatchMovies: [...userProfile.toWatchMovies, movieId],
        );
      case ListType.watchlistShows:
        return userProfile.copyWith(
          toWatchShows: [...userProfile.toWatchShows, movieId],
        );
      default:
        return userProfile;
    }
  }

  UserProfile _removeFromUser({
    required UserProfile userProfile,
    required ListType listType,
    required int movieId,
  }) {
    switch (listType) {
      case ListType.favoriteMovies:
        return userProfile.copyWith(
          favoriteMovies: [...userProfile.favoriteMovies]..remove(movieId),
        );
      case ListType.favoriteShows:
        return userProfile.copyWith(
          favoriteTvShows: [...userProfile.favoriteTvShows]..remove(movieId),
        );
      case ListType.watchedMovies:
        return userProfile.copyWith(
          watchedMovies: [...userProfile.watchedMovies]..remove(movieId),
        );
      case ListType.watchedShows:
        return userProfile.copyWith(
          watchedShows: [...userProfile.watchedShows]..remove(movieId),
        );
      case ListType.watchlistMovies:
        return userProfile.copyWith(
          toWatchMovies: [...userProfile.toWatchMovies]..remove(movieId),
        );
      case ListType.watchlistShows:
        return userProfile.copyWith(
          toWatchShows: [...userProfile.toWatchShows]..remove(movieId),
        );
      default:
        return userProfile;
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
