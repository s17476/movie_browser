import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepository {
  Stream<User?> get user;

  Future<Either<Failure, Unit>> signupWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email});

  Future<Either<Failure, Unit>> signout();

  Future<Either<Failure, Unit>> deleteAccount({required String password});
}
