import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_browser/features/core/utils/logger.dart';

class MyBlocObserver extends BlocObserver {
  late final List<Type> observed;

  MyBlocObserver({this.observed = const []});

  bool _isObserved(BlocBase bloc) =>
      observed.isEmpty ||
      observed.any((element) => element == bloc.runtimeType);

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    if (_isObserved(bloc)) {
      Log.t('${bloc.runtimeType} Created');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    if (_isObserved(bloc)) {
      Log.i('${bloc.runtimeType}, $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (_isObserved(bloc) && bloc is Cubit) {
      Log.d(
        '${bloc.runtimeType}, ${change.runtimeType}\nCurrent state: ${change.currentState}\nNext state: ${change.nextState}',
      );
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    if (_isObserved(bloc)) {
      Log.d(
        '${bloc.runtimeType}, ${transition.runtimeType}\nCurrent state: ${transition.currentState}\nEvent: ${transition.event}\nNext state: ${transition.nextState}',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (_isObserved(bloc)) {
      Log.e('${bloc.runtimeType}, $error');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    if (_isObserved(bloc)) {
      Log.t('${bloc.runtimeType} Closed');
    }
  }
}
