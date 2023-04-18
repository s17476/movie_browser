import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile>> fetchUserProfile(String userId);
  Future<Either<Failure, String>> createGuestSession();
  Future<Either<Failure, Unit>> createUserProfile(UserProfile userProfile);
  Future<Either<Failure, Unit>> updateUserProfile();
  Future<Either<Failure, Unit>> deleteUserProfile(String userId);
}
