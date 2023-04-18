import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_browser/features/profile/data/models/user_profile_dto.dart';

import '../../../core/errors/failure.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/services/profile_api_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService _apiService;
  final FirebaseFirestore _firebaseFirestore;

  ProfileRepositoryImpl(
    this._apiService,
    this._firebaseFirestore,
  );

  @override
  Future<Either<Failure, Unit>> deleteUserProfile() {
    // TODO: implement deleteUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserProfile>> fetchUserProfile(String userId) async {
    try {
      final userSnapshot =
          await _firebaseFirestore.collection('users').doc(userId).get();

      if (userSnapshot.exists) {
        final userProfileDto = UserProfileDto.fromFirestore(userSnapshot);
        final userProfile = userProfileDto.toDomain();
        return Right(userProfile);
      } else {
        return left(const Failure.userNotFound(message: ''));
      }
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile() {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> createGuestSession() async {
    try {
      final sessionId = await _apiService.createGuestSession();
      return right(sessionId);
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createUserProfile(
      UserProfile userProfile) async {
    try {
      final userReference =
          _firebaseFirestore.collection('users').doc(userProfile.id);

      final userProfileDto = UserProfileDto.fromDomain(userProfile);

      userReference.set(userProfileDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }
}
