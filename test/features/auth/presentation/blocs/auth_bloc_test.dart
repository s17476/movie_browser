import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_browser/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late StreamController<User?> userStreamController;

  late MockUser mockUser;
  late AuthBlocState tAuthenticatedState;

  late AuthBloc bloc;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    userStreamController = StreamController<User?>();

    when(() => mockAuthRepository.user).thenAnswer(
      (_) => userStreamController.stream,
    );

    mockUser = MockUser();
    when(() => mockUser.uid).thenReturn('uid');
    when(() => mockUser.email).thenReturn('email');
    when(() => mockUser.displayName).thenReturn('displayName');
    when(() => mockUser.photoURL).thenReturn('photoUrl');
    when(() => mockUser.providerData).thenReturn([]);

    tAuthenticatedState = AuthBlocState.authenticated(
      userId: mockUser.uid,
      displayName: mockUser.displayName,
      email: mockUser.email,
      photoUrl: mockUser.photoURL,
      providerId: mockUser.providerData,
    );

    bloc = AuthBloc(mockAuthRepository);
  });

  group('AuthBloc', () {
    test(
      'should emit AuthState.initial() as an initial state',
      () async {
        // assert
        expect(bloc.state, const AuthBlocState.initial());
      },
    );

    group('autoSignIn event', () {
      blocTest(
        'should emit AuthState.authenticated',
        build: () => bloc,
        act: (_) => userStreamController.add(mockUser),
        expect: () => [tAuthenticatedState],
      );
    });

    group('signOut event', () {
      blocTest(
        'should emit error state',
        build: () => bloc,
        setUp: () => when(() => mockAuthRepository.signout()).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (bloc) => bloc.add(const AuthBlocEvent.signOut()),
        expect: () => [
          const AuthBlocState.submitting(),
          const AuthBlocState.error(message: ''),
        ],
      );

      blocTest(
        'should emit initial state',
        build: () => bloc,
        setUp: () => when(() => mockAuthRepository.signout()).thenAnswer(
          (_) async => right(unit),
        ),
        act: (bloc) => bloc.add(const AuthBlocEvent.signOut()),
        expect: () => [
          const AuthBlocState.submitting(),
          const AuthBlocState.initial(),
        ],
      );
    });

    group('deleteUser event', () {
      blocTest(
        'should emit [submitting, authenticated] states',
        build: () => bloc,
        seed: () => tAuthenticatedState,
        setUp: () => when(() => mockAuthRepository.deleteAccount(
            password: any(named: 'password'))).thenAnswer(
          (_) async => left(
            const Failure.general(message: ''),
          ),
        ),
        act: (bloc) => bloc.add(const AuthBlocEvent.deleteUser()),
        expect: () => [
          const AuthBlocState.submitting(),
          AuthBlocState.authenticated(
            userId: mockUser.uid,
            displayName: mockUser.displayName,
            email: mockUser.email,
            photoUrl: mockUser.photoURL,
            providerId: mockUser.providerData,
            errorMessage: '',
          ),
        ],
      );

      blocTest(
        'should emit [submitting, initial] states',
        build: () => bloc,
        seed: () => tAuthenticatedState,
        setUp: () => when(() => mockAuthRepository.deleteAccount(
            password: any(named: 'password'))).thenAnswer(
          (_) async => right(unit),
        ),
        act: (bloc) => bloc.add(const AuthBlocEvent.deleteUser()),
        expect: () => [
          const AuthBlocState.submitting(),
          const AuthBlocState.initial(),
        ],
      );
    });
  });
}
