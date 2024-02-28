import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_browser/features/settings/presentation/blocs/language_cubit.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late MockStorage storage;
  late LanguageCubit cubit;

  setUp(() {});

  setUpAll(() {
    storage = MockStorage();
    HydratedBloc.storage = storage;
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
  });
}
