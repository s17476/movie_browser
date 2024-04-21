import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockFacebookAuth extends Mock implements FacebookAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockUserInfo extends Mock implements UserInfo {}

class MockLoginResult extends Mock implements LoginResult {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockFacebookAuth mockFacebookAuth;
  late FirebaseFirestore firebaseFirestore;

  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockUserInfo mockUserInfo;
  late MockLoginResult mockLoginResult;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;

  late AuthenticationRepositoryImpl repository;

  const tEmail = 'test@test.com';
  const tPassword = 'password';
  const tUid = 'uid';

  setUpAll(() {
    registerFallbackValue(
      const AuthCredential(providerId: '', signInMethod: ''),
    );
    registerFallbackValue(AppleAuthProvider());
  });

  setUp(() {
    firebaseFirestore = FakeFirebaseFirestore();
    mockFacebookAuth = MockFacebookAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockFirebaseAuth = MockFirebaseAuth();

    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockUserInfo = MockUserInfo();
    mockLoginResult = MockLoginResult();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

    repository = AuthenticationRepositoryImpl(
      mockFirebaseAuth,
      mockGoogleSignIn,
      mockFacebookAuth,
      firebaseFirestore,
    );
  });

  final tAccessToken = AccessToken(
    declinedPermissions: [],
    grantedPermissions: [],
    userId: 'userId',
    expires: DateTime(2050),
    lastRefresh: DateTime.now(),
    token: 'token',
    applicationId: 'applicationId',
    isExpired: false,
    dataAccessExpirationTime: DateTime(2050),
  );

  group('AuthenticationRepositoryImpl', () {
    group('signinWithEmailAndPassword()', () {
      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenThrow(FirebaseAuthException(code: '0'));

          // act
          final result = await repository.signinWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(
            result,
            left(const Failure.auth(message: '')),
          );
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenThrow(Exception());

          // act
          final result = await repository.signinWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenAnswer((_) async => MockUserCredential());

          // act
          final result = await repository.signinWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(result, right(unit));
        },
      );
    });

    group('signout()', () {
      test(
        'should return Failure.general if facebookAuth throws an Exception',
        () async {
          // arrange
          when(() => mockFacebookAuth.logOut()).thenThrow(Exception());
          when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => () {});
          when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

          // act
          final result = await repository.signout();

          // assert
          expect(result, left(const Failure.general(message: '')));
        },
      );

      test(
        'should return Failure.general if firebaseAuth throws an Exception',
        () async {
          // arrange
          when(() => mockFacebookAuth.logOut()).thenAnswer((_) async => () {});
          when(() => mockFirebaseAuth.signOut()).thenThrow(Exception());
          when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

          // act
          final result = await repository.signout();

          // assert
          expect(result, left(const Failure.general(message: '')));
        },
      );

      test(
        'should return Failure.general if googleSignIn throws an Exception',
        () async {
          // arrange
          when(() => mockFacebookAuth.logOut()).thenAnswer((_) async => () {});
          when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => () {});
          when(() => mockGoogleSignIn.signOut()).thenThrow(Exception());

          // act
          final result = await repository.signout();

          // assert
          expect(result, left(const Failure.general(message: '')));
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(() => mockFacebookAuth.logOut()).thenAnswer((_) async => () {});
          when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async => () {});
          when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);

          // act
          final result = await repository.signout();

          // assert
          expect(result, right(unit));
        },
      );
    });

    group('signupWithEmailAndPassword()', () {
      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenThrow(FirebaseAuthException(code: '0'));

          // act
          final result = await repository.signupWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(
            result,
            left(const Failure.auth(message: '')),
          );
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenThrow(Exception());

          // act
          final result = await repository.signupWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenAnswer((_) async => MockUserCredential());

          // act
          final result = await repository.signupWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          );

          // assert
          expect(result, right(unit));
        },
      );
    });

    group('sendPasswordResetEmail()', () {
      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.sendPasswordResetEmail(
              email: tEmail,
            ),
          ).thenThrow(FirebaseAuthException(code: '0'));

          // act
          final result = await repository.sendPasswordResetEmail(
            email: tEmail,
          );

          // assert
          expect(
            result,
            left(const Failure.auth(message: '')),
          );
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.sendPasswordResetEmail(
              email: tEmail,
            ),
          ).thenThrow(Exception());

          // act
          final result = await repository.sendPasswordResetEmail(
            email: tEmail,
          );

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception')),
          );
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(
            () => mockFirebaseAuth.sendPasswordResetEmail(
              email: tEmail,
            ),
          ).thenAnswer((_) async => MockUserCredential());

          // act
          final result = await repository.sendPasswordResetEmail(
            email: tEmail,
          );

          // assert
          expect(result, right(unit));
        },
      );
    });

    group('deleteAccount()', () {
      setUp(() {
        when(() => mockUser.providerData).thenReturn([mockUserInfo]);

        when(() => mockUser.delete()).thenAnswer((_) async {});

        when(() => mockUser.email).thenReturn(tEmail);

        when(() => mockUser.uid).thenReturn(tUid);

        when(() => mockUser.reauthenticateWithCredential(any())).thenAnswer(
          (_) async => mockUserCredential,
        );

        when(() => mockUser.reauthenticateWithProvider(any())).thenAnswer(
          (_) async => mockUserCredential,
        );

        when(() => mockUserCredential.user).thenReturn(mockUser);

        when(() => mockLoginResult.status).thenReturn(LoginStatus.success);

        when(() => mockLoginResult.accessToken).thenReturn(tAccessToken);

        when(() => mockFacebookAuth.login()).thenAnswer(
          (_) async => mockLoginResult,
        );

        when(() => mockGoogleSignIn.signIn()).thenAnswer(
          (_) async => mockGoogleSignInAccount,
        );

        when(() => mockGoogleSignInAccount.authentication).thenAnswer(
          (_) async => mockGoogleSignInAuthentication,
        );

        when(() => mockGoogleSignInAuthentication.accessToken)
            .thenReturn('accessToken');

        when(() => mockGoogleSignInAuthentication.idToken)
            .thenReturn('idToken');
      });
      test(
        'should return Failure.general',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenThrow(Exception());

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(result, left(const Failure.general(message: 'Exception')));
        },
      );

      test(
        'should return Failure.general(\'Deletion failed\')',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

          when(() => mockUserInfo.providerId).thenReturn('');

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(
            result,
            left(const Failure.general(message: 'Exception: Deletion failed')),
          );
        },
      );

      test(
        'should return Unit - email provider',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

          when(() => mockUserInfo.providerId).thenReturn('password');

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(result, right(unit));
        },
      );

      test(
        'should return Unit - facebook provider',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

          when(() => mockUserInfo.providerId).thenReturn('facebook');

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(result, right(unit));
        },
      );

      test(
        'should return Unit - google provider',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

          when(() => mockUserInfo.providerId).thenReturn('google');

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(result, right(unit));
        },
      );

      test(
        'should return Unit - apple provider',
        () async {
          // arrange
          when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

          when(() => mockUserInfo.providerId).thenReturn('apple');

          // act
          final result = await repository.deleteAccount(password: tPassword);

          // assert
          expect(result, right(unit));
        },
      );
    });

    group('signInWithGoogle()', () {
      test(
        'should return Failure.cancellebByUser',
        () async {
          // arrange
          when(() => mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

          // act
          final result = await repository.signInWithGoogle();

          // assert
          expect(result, left(const Failure.cancelledByUser(message: '')));
        },
      );

      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(() => mockGoogleSignIn.signIn()).thenThrow(
            FirebaseAuthException(code: ''),
          );

          // act
          final result = await repository.signInWithGoogle();

          // assert
          expect(result, left(const Failure.auth(message: '')));
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(() => mockGoogleSignIn.signIn()).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.signInWithGoogle();

          // assert
          expect(result, left(const Failure.general(message: 'Exception')));
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(() => mockGoogleSignIn.signIn()).thenAnswer(
            (_) async => mockGoogleSignInAccount,
          );

          when(() => mockGoogleSignInAccount.authentication).thenAnswer(
            (_) async => mockGoogleSignInAuthentication,
          );

          when(() => mockGoogleSignInAuthentication.accessToken).thenReturn(
            'accessToken',
          );

          when(() => mockGoogleSignInAuthentication.idToken).thenReturn(
            'idToken',
          );

          when(() => mockFirebaseAuth.signInWithCredential(any())).thenAnswer(
            (_) async => mockUserCredential,
          );

          // act
          final result = await repository.signInWithGoogle();

          // assert
          expect(result, right(unit));
        },
      );
    });
    group('signInWithApple()', () {
      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(() => mockFirebaseAuth.signInWithProvider(any())).thenThrow(
            FirebaseAuthException(code: ''),
          );

          // act
          final result = await repository.signInWithApple();

          // assert
          expect(result, left(const Failure.auth(message: '')));
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(() => mockFirebaseAuth.signInWithProvider(any())).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.signInWithApple();

          // assert
          expect(result, left(const Failure.general(message: 'Exception')));
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(() => mockFirebaseAuth.signInWithProvider(any())).thenAnswer(
            (_) async => mockUserCredential,
          );

          // act
          final result = await repository.signInWithApple();

          // assert
          expect(result, right(unit));
        },
      );
    });
    group('signInWithFacebook()', () {
      test(
        'should return Failure.cancellebByUser',
        () async {
          // arrange
          when(() => mockFacebookAuth.login()).thenAnswer(
            (_) async => LoginResult(status: LoginStatus.failed),
          );

          // act
          final result = await repository.signInWithFacebook();

          // assert
          expect(result, left(const Failure.cancelledByUser(message: '')));
        },
      );

      test(
        'should return Failure.auth',
        () async {
          // arrange
          when(() => mockFacebookAuth.login()).thenThrow(
            FirebaseAuthException(code: ''),
          );

          // act
          final result = await repository.signInWithFacebook();

          // assert
          expect(result, left(const Failure.auth(message: '')));
        },
      );

      test(
        'should return Failure.general',
        () async {
          // arrange
          when(() => mockFacebookAuth.login()).thenThrow(
            Exception(),
          );

          // act
          final result = await repository.signInWithFacebook();

          // assert
          expect(result, left(const Failure.general(message: 'Exception')));
        },
      );

      test(
        'should return Unit',
        () async {
          // arrange
          when(() => mockFacebookAuth.login()).thenAnswer(
            (_) async => LoginResult(
              status: LoginStatus.success,
              accessToken: tAccessToken,
            ),
          );

          when(() => mockFirebaseAuth.signInWithCredential(any())).thenAnswer(
            (_) async => mockUserCredential,
          );

          // act
          final result = await repository.signInWithFacebook();

          // assert
          expect(result, right(unit));
        },
      );
    });
  });
}
