import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/services/profile_api_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService apiService;

  ProfileRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, Unit>> deleteUserProfile() {
    // TODO: implement deleteUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserProfile>> fetchUserProfile() {
    // TODO: implement fetchUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateUserProfile() {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
