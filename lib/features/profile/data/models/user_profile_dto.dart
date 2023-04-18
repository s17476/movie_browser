// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_profile.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
class UserProfileDto with _$UserProfileDto {
  const UserProfileDto._();

  const factory UserProfileDto({
    @JsonKey(ignore: true) @Default('') String id,
    required String sessionId,
    required List<int> ratedMovies,
    required List<int> ratedTvShows,
    required List<int> favoriteMovies,
    required List<int> favoriteTvShows,
    required List<int> toWatchMovies,
    required List<int> toWatchShows,
    required List<int> watchedMovies,
    required List<int> watchedShows,
  }) = _UserProfileDto;

  factory UserProfileDto.fromDomain(UserProfile userProfile) => UserProfileDto(
        id: userProfile.id,
        sessionId: userProfile.sessionId,
        ratedMovies: userProfile.ratedMovies,
        ratedTvShows: userProfile.ratedTvShows,
        favoriteMovies: userProfile.favoriteMovies,
        favoriteTvShows: userProfile.favoriteTvShows,
        toWatchMovies: userProfile.toWatchMovies,
        toWatchShows: userProfile.toWatchShows,
        watchedMovies: userProfile.watchedMovies,
        watchedShows: userProfile.watchedShows,
      );

  UserProfile toDomain() => UserProfile(
        id: id,
        sessionId: sessionId,
        ratedMovies: ratedMovies,
        ratedTvShows: ratedTvShows,
        favoriteMovies: favoriteMovies,
        favoriteTvShows: favoriteTvShows,
        toWatchMovies: toWatchMovies,
        toWatchShows: toWatchShows,
        watchedMovies: watchedMovies,
        watchedShows: watchedShows,
      );

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  factory UserProfileDto.fromFirestore(DocumentSnapshot doc) =>
      UserProfileDto.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(id: doc.id);
}
