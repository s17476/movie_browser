import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/auth_repository.dart';

part 'email_provider_cubit.freezed.dart';
part 'email_provider_state.dart';

@injectable
class EmailProviderCubit extends Cubit<EmailProviderState> {
  final AuthRepository _repository;

  EmailProviderCubit(
    this._repository,
  ) : super(const EmailProviderState.initial());

  Future<void> signupWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await _repository.signupWithEmailAndPassword(
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

    emit(const EmailProviderState.submitting());

    final failureOrUnit = await _repository.signinWithEmailAndPassword(
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

    final failureOrUnit =
        await _repository.sendPasswordResetEmail(email: email);

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }

  Future<void> deleteAccount(String password) async {
    emit(const EmailProviderState.submitting());

    final failureOrUnit = await _repository.deleteAccount(password: password);

    await failureOrUnit.fold(
        (failure) async =>
            emit(EmailProviderState.error(message: failure.message)),
        (_) async => emit(const EmailProviderState.submitted()));
  }
}
