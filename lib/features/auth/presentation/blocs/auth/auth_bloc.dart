import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository repository;
  late StreamSubscription streamSubscription;
  AuthBloc(
    this.repository,
  ) : super(const _Initial()) {
    streamSubscription = repository.user.listen((user) {
      if (user != null) {
        add(AuthBlocEvent.autoSignIn(user: user));
      }
    });

    on<AuthBlocEvent>((event, emit) async {
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
          emit(const AuthBlocState.submitting());
          final failureOrUnit = await repository.signout();
          await failureOrUnit.fold(
            (failure) async => emit(
              AuthBlocState.error(
                message: failure.message,
              ),
            ),
            (_) async => emit(const AuthBlocState.initial()),
          );
        },
        deleteUser: (event) async {
          await state.mapOrNull(
            authenticated: (state) async {
              final oldState = state;
              emit(const AuthBlocState.submitting());

              final failureOrUnit =
                  await repository.deleteAccount(password: event.password);
              await failureOrUnit.fold(
                (failure) async => emit(
                  oldState.copyWith(
                    errorMessage: failure.message,
                  ),
                ),
                (_) async => emit(const AuthBlocState.initial()),
              );
            },
          );
        },
      );
    });
  }

  @disposeMethod
  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
