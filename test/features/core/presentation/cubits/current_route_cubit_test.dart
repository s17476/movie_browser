import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_browser/app/routes.dart';
import 'package:movie_browser/features/core/presentation/cubits/current_route/current_route_cubit.dart';

void main() {
  late CurrentRouteCubit cubit;

  setUp(() {
    cubit = CurrentRouteCubit();
  });

  group('CurrentRouteCubit', () {
    test(
      'Should emit [\'/\'] as an initial route',
      () async {
        // assert
        expect(cubit.state.route, '/');
      },
    );

    blocTest(
      'Should emit updated state',
      build: () => cubit,
      act: (cubit) => cubit.update(Routes.genrePage),
      expect: () =>
          [const CurrentRouteState(route: Routes.genrePage, previous: '/')],
    );

    blocTest(
      'Should not emit any state and return false when isCurrent is called',
      build: () => cubit,
      seed: () => const CurrentRouteState(route: Routes.genrePageTvShowDetails),
      expect: () {
        final result = cubit.state.isCurrent(Routes.personDetails);
        expect(result, false);
        return [];
      },
    );

    blocTest(
      'Should not emit any state and return true when isCurrent is called',
      build: () => cubit,
      seed: () => const CurrentRouteState(route: Routes.genrePage),
      expect: () {
        final result = cubit.state.isCurrent(Routes.genrePage);
        expect(result, true);
        return [];
      },
    );
  });
}
