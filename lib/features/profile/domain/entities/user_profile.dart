import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String id,
    required String sessionId,
    required List<int> ratedMovies,
    required List<int> ratedTvShows,
    required List<int> favoriteMovies,
    required List<int> favoriteTvShows,
    required List<int> toWatchMovies,
    required List<int> toWatchShows,
    required List<int> watchedMovies,
    required List<int> watchedShows,
  }) = _UserProfile;

  factory UserProfile.newUser(String id) => UserProfile(
        id: id,
        sessionId: '',
        ratedMovies: [],
        ratedTvShows: [],
        favoriteMovies: [],
        favoriteTvShows: [],
        toWatchMovies: [],
        toWatchShows: [],
        watchedMovies: [],
        watchedShows: [],
      );
}
