import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/auth/presentation/cubits/apple_provider/apple_provider_cubit.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

import 'auth_bloc_test.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late AppleProviderCubit cubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    cubit = AppleProviderCubit(mockAuthRepository);
  });

  group('AppleProviderCubit', () {
    test(
      'should emit AppleProvider.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const AppleProviderState.initial());
      },
    );
    group('signIn()', () {
      blocTest(
        'should emit [submitting, error] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithApple()).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const AppleProviderState.submitting(),
          const AppleProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithApple()).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const AppleProviderState.submitting(),
          const AppleProviderState.submitted(),
        ],
      );
    });
  });
}
