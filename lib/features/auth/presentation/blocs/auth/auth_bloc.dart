import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository _repository;
  late StreamSubscription _streamSubscription;
  AuthBloc(
    this._repository,
  ) : super(const _Initial()) {
    _streamSubscription = _repository.user.listen((user) {
      if (user != null) {
        add(AuthBlocEvent.autoSignIn(user: user));
      }
    });

    on<AuthBlocEvent>((event, emit) async {
      emit(const AuthBlocState.submitting());

      await event.map(
        autoSignIn: (event) async {
          emit(
            AuthBlocState.authenticated(
              userId: event.user.uid,
              email: event.user.email,
              displayName: event.user.displayName,
              photoUrl: event.user.photoURL,
              providerId: event.user.providerData,
            ),
          );
        },
        signOut: (event) async {
          final failureOrUnit = await _repository.signout();
          await failureOrUnit.fold(
            (failure) async => emit(
              AuthBlocState.error(
                message: failure.message,
              ),
            ),
            (_) async => emit(const AuthBlocState.initial()),
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
