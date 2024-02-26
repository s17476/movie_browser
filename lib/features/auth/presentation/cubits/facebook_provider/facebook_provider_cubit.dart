import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';

part 'facebook_provider_cubit.freezed.dart';
part 'facebook_provider_state.dart';

@injectable
class FacebookProviderCubit extends Cubit<FacebookProviderState> {
  final AuthRepository _repository;

  FacebookProviderCubit(
    this._repository,
  ) : super(const FacebookProviderState.initial());

  Future<void> signIn() async {
    emit(const FacebookProviderState.submitting());

    final failureOrUnit = await _repository.signInWithFacebook();

    await failureOrUnit.fold(
        (failure) async =>
            emit(FacebookProviderState.error(message: failure.message)),
        (_) async => emit(const FacebookProviderState.submitted()));
  }
}
