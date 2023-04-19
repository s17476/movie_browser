import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/services/profile_api_service.dart';
import '../models/user_profile_dto.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService _apiService;
  final FirebaseFirestore _firebaseFirestore;

  ProfileRepositoryImpl(
    this._apiService,
    this._firebaseFirestore,
  );

  @override
  Future<Either<Failure, Unit>> deleteUserProfile(String userId) async {
    try {
      await _firebaseFirestore.collection('users').doc(userId).delete();

      return const Right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
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
  Future<Either<Failure, Unit>> updateUserProfile(
    UserProfile userProfile,
  ) async {
    try {
      final userReference =
          _firebaseFirestore.collection('users').doc(userProfile.id);

      final userProfileDto = UserProfileDto.fromDomain(userProfile);

      await userReference.update(userProfileDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
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
    UserProfile userProfile,
  ) async {
    try {
      final userReference =
          _firebaseFirestore.collection('users').doc(userProfile.id);

      final userProfileDto = UserProfileDto.fromDomain(userProfile);

      await userReference.set(userProfileDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> rateMovie(
    int movieId,
    String sessionId,
    int value,
  ) async {
    try {
      await _apiService.rateMovie(movieId, sessionId, value);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> rateTvShow(
    int showId,
    String sessionId,
    int value,
  ) async {
    try {
      await _apiService.rateMovie(showId, sessionId, value);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return left(Failure.general(message: e.toString()));
    }
  }
}
