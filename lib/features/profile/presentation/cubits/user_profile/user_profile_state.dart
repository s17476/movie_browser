// ignore_for_file: unused_element

part of 'user_profile_cubit.dart';

@freezed
sealed class UserProfileState with _$UserProfileState {
  const UserProfileState._();

  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.error() = _Error;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.loaded({
    required UserProfile userProfile,
    required bool isError,
  }) = _Loaded;

  bool listContains({required ListType listType, required int movieId}) {
    return maybeMap(
      loaded: (state) {
        switch (listType) {
          case ListType.favoriteMovies:
            return state.userProfile.favoriteMovies.contains(movieId);
          case ListType.favoriteShows:
            return state.userProfile.favoriteTvShows.contains(movieId);
          case ListType.ratedMovies:
            return state.userProfile.ratedMovies.contains(movieId);
          case ListType.ratedShows:
            return state.userProfile.ratedTvShows.contains(movieId);
          case ListType.watchedMovies:
            return state.userProfile.watchedMovies.contains(movieId);
          case ListType.watchedShows:
            return state.userProfile.watchedShows.contains(movieId);
          case ListType.watchlistMovies:
            return state.userProfile.toWatchMovies.contains(movieId);
          case ListType.watchlistShows:
            return state.userProfile.toWatchShows.contains(movieId);
          default:
            return false;
        }
      },
      orElse: () => false,
    );
  }
}
