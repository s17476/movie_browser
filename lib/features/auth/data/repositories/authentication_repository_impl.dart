import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failure.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthenticationRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthenticationRepositoryImpl(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Stream<User?> get user => _firebaseAuth.authStateChanges();

  @override
  Future<Either<Failure, Unit>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount({
    required String password,
  }) async {
    try {
      final user = _firebaseAuth.currentUser!;
      // reauthenticate with credencial
      final credential =
          EmailAuthProvider.credential(email: user.email!, password: password);

      final authResult = await user.reauthenticateWithCredential(credential);

      // delete user account
      await authResult.user!.delete();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return const Left(Failure.cancelledByUser(message: ''));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }
}
