import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';

part 'apple_provider_cubit.freezed.dart';
part 'apple_provider_state.dart';

@injectable
class AppleProviderCubit extends Cubit<AppleProviderState> {
  final AuthRepository _repository;

  AppleProviderCubit(
    this._repository,
  ) : super(const AppleProviderState.initial());

  Future<void> signIn() async {
    emit(const AppleProviderState.submitting());

    final failureOrUnit = await _repository.signInWithApple();

    await failureOrUnit.fold(
        (failure) async =>
            emit(AppleProviderState.error(message: failure.message)),
        (_) async => emit(const AppleProviderState.submitted()));
  }
}
