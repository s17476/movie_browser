import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';

part 'email_provider_cubit.freezed.dart';
part 'email_provider_state.dart';

@injectable
class EmailProviderCubit extends Cubit<EmailProviderState> {
  final AuthRepository repository;

  EmailProviderCubit(
    this.repository,
  ) : super(const EmailProviderState.initial());

  Future<void> signupWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await repository.signupWithEmailAndPassword(
      email: email,
      password: password,
    );

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }

  Future<void> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await repository.signinWithEmailAndPassword(
      email: email,
      password: password,
    );

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }

  Future<void> resetPassword(String email) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await repository.sendPasswordResetEmail(email: email);

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }

  Future<void> deleteAccount(String password) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await repository.deleteAccount(password: password);

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }
}
