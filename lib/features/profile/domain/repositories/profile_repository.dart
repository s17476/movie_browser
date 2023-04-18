import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile>> fetchUserProfile();
  Future<Either<Failure, Unit>> updateUserProfile();
  Future<Either<Failure, Unit>> deleteUserProfile();
}
