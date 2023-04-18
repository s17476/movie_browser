part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;
  const factory UserProfileState.error() = _Error;
  const factory UserProfileState.loading() = _Loading;
  const factory UserProfileState.loaded({
    required UserProfile userProfile,
  }) = _Loaded;
}
