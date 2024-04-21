import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_browser/features/auth/presentation/cubits/google_provider/google_provider_cubit.dart';
import 'package:movie_browser/features/core/errors/failure.dart';

import 'auth_bloc_test.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late GoogleProviderCubit cubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();

    cubit = GoogleProviderCubit(mockAuthRepository);
  });

  group('GoogleProviderCubit', () {
    test(
      'should emit GoogleProviderState.initial as an initial state',
      () async {
        // assert
        expect(cubit.state, const GoogleProviderState.initial());
      },
    );
    group('signIn()', () {
      blocTest(
        'should emit [submitting, error] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithGoogle()).thenAnswer(
          (_) async => left(const Failure.general(message: '')),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const GoogleProviderState.submitting(),
          const GoogleProviderState.error(message: ''),
        ],
      );

      blocTest(
        'should emit [submitting, submitted] states',
        build: () => cubit,
        setUp: () =>
            when(() => mockAuthRepository.signInWithGoogle()).thenAnswer(
          (_) async => right(unit),
        ),
        act: (cubit) => cubit.signIn(),
        expect: () => [
          const GoogleProviderState.submitting(),
          const GoogleProviderState.submitted(),
        ],
      );
    });
  });
}
