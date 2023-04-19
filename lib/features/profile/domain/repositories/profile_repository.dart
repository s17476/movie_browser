import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile>> fetchUserProfile(String userId);
  Future<Either<Failure, String>> createGuestSession();
  Future<Either<Failure, Unit>> createUserProfile(UserProfile userProfile);
  Future<Either<Failure, Unit>> updateUserProfile(UserProfile userProfile);
  Future<Either<Failure, Unit>> deleteUserProfile(String userId);
  Future<Either<Failure, Unit>> rateMovie(
    int movieId,
    String sessionId,
    int value,
  );
  Future<Either<Failure, Unit>> rateTvShow(
    int showId,
    String sessionId,
    int value,
  );
}
