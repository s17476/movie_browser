import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
        return right(UserProfile.newUser('id'));
        // final UserProfile userProfile =
        //     UserProfileModel.fromMap(userSnapshot.data()!, userSnapshot.id);
        // return Right(userProfile);
      } else {
        throw Exception(['No user found for the given ID']);
      }
    } on FirebaseException catch (e) {
      return Left(Failure.general(message: e.message ?? 'DataBase Failure'));
    } catch (e) {
      return Left(
        Failure.general(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile() {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
