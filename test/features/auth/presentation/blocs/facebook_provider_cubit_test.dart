import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/auth/presentation/cubits/facebook_provider/facebook_provider_cubit.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

import 'auth_bloc_test.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late FacebookProviderCubit cubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    cubit = FacebookProviderCubit(mockAuthRepository);
  });

  group('FacebookProviderCubit', () {
    test(
      'should emit FacebookProviderState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const FacebookProviderState.initial());
      },
    );
    group('signIn()', () {
      blocTest(
        'should emit [submitting, error] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithFacebook()).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const FacebookProviderState.submitting(),
          const FacebookProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithFacebook()).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const FacebookProviderState.submitting(),
          const FacebookProviderState.submitted(),
        ],
      );
    });
  });
}
