import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:movie_browser/features/auth/domain/repositories/auth_repository.dart';

part 'google_provider_cubit.freezed.dart';
part 'google_provider_state.dart';

@injectable
class GoogleProviderCubit extends Cubit<GoogleProviderState> {
  final AuthRepository repository;

  GoogleProviderCubit(
    this.repository,
  ) : super(const GoogleProviderState.initial());

  Future<void> signIn() async {
    emit(const GoogleProviderState.submitting());

    final failureOrUnit = await repository.signInWithGoogle();

    await failureOrUnit.fold(
        (failure) async =>
            emit(GoogleProviderState.error(message: failure.message)),
        (_) async => emit(const GoogleProviderState.submitted()));
  }
}
