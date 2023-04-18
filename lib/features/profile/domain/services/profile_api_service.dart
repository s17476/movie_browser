import '../entities/user_profile.dart';

abstract class ProfileApiService {
  Future<UserProfile> fetchUserProfile();
  Future<void> updateUserProfile();
  Future<void> deleteUserProfile();
}
