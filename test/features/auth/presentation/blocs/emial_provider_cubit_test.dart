import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/auth/presentation/cubits/email_provider/email_provider_cubit.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

import 'auth_bloc_test.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late EmailProviderCubit cubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    cubit = EmailProviderCubit(mockAuthRepository);
  });

  const tEmail = 'emial';
  const tPassword = 'password';

  group('EmailProviderCubit', () {
    test(
      'should emit EmailProviderState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const EmailProviderState.initial());
      },
    );

    group('signupWithEmailAndPassword()', () {
      blocTest(
        'should emit [sibmitting, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.signupWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.signupWithEmailAndPassword(tEmail, tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.signupWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.signupWithEmailAndPassword(tEmail, tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.submitted(),
        ],
      );
    });

    group('signinWithEmailAndPassword()', () {
      blocTest(
        'should emit [sibmitting, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.signinWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.signinWithEmailAndPassword(tEmail, tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.signinWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.signinWithEmailAndPassword(tEmail, tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.submitted(),
        ],
      );
    });

    group('resetPassword()', () {
      blocTest(
        'should emit [sibmitting, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.sendPasswordResetEmail(
            email: any(named: 'email'),
          ),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.resetPassword(tEmail),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.sendPasswordResetEmail(
            email: any(named: 'email'),
          ),
        ).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.resetPassword(tEmail),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.submitted(),
        ],
      );
    });

    group('deleteAccount()', () {
      blocTest(
        'should emit [sibmitting, error] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.deleteAccount(
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.deleteAccount(tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () => when(
          () => mockAuthRepository.deleteAccount(
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.deleteAccount(tPassword),
        expect: () => [
          const EmailProviderState.submitting(),
          const EmailProviderState.submitted(),
        ],
      );
    });
  });
}
