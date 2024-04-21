import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

@LazySingleton(as: AuthRepository)
class AuthenticationRepositoryImpl extends AuthRepository {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthenticationRepositoryImpl(
    this.firebaseAuth,
    this.googleSignIn,
    this.facebookAuth,
    this.firebaseFirestore,
  );

  @override
  Stream<User?> get user => firebaseAuth.authStateChanges();

  @override
  Future<Either<Failure, Unit>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
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
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
      await facebookAuth.logOut();
    } catch (_) {
      return left(const Failure.general(message: ''));
    }

    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
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
      await firebaseAuth.sendPasswordResetEmail(email: email);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount({
    String? password,
  }) async {
    try {
      final user = firebaseAuth.currentUser!;

      final providerData = user.providerData[0];

      UserCredential? authResult;

      if (providerData.providerId.contains('password') && password != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );

        authResult = await user.reauthenticateWithCredential(credential);
      } else if (providerData.providerId.contains('facebook')) {
        final LoginResult result = await facebookAuth.login();

        if (result.status == LoginStatus.success) {
          final OAuthCredential credential = FacebookAuthProvider.credential(
            result.accessToken!.token,
          );

          authResult = await user.reauthenticateWithCredential(credential);
        }
      } else if (providerData.providerId.contains('google')) {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        if (googleUser == null) {
          return const Left(Failure.cancelledByUser(message: ''));
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        authResult = await user.reauthenticateWithCredential(credential);
      } else if (providerData.providerId.contains('apple')) {
        final appleProvider =
            AppleAuthProvider().addScope('fullName').addScope('email');

        authResult = await user.reauthenticateWithProvider(appleProvider);
      }

      if (authResult == null) {
        throw Exception('Deletion failed');
      }
      await firebaseFirestore.collection('users').doc(user.uid).delete();
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
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return const Left(Failure.cancelledByUser(message: ''));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithApple() async {
    try {
      final appleProvider =
          AppleAuthProvider().addScope('fullName').addScope('email');

      await firebaseAuth.signInWithProvider(appleProvider);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithFacebook() async {
    try {
      final LoginResult result = await facebookAuth.login();

      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );

        // Once signed in, return the UserCredential
        await firebaseAuth.signInWithCredential(credential);

        return right(unit);
      }
      return const Left(Failure.cancelledByUser(message: ''));
    } on FirebaseAuthException catch (e) {
      return Left(Failure.auth(message: e.message ?? ''));
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }
}
