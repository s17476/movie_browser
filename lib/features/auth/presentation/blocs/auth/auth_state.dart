part of 'auth_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = _Initial;
  const factory AuthBlocState.submitting() = _Submitting;
  const factory AuthBlocState.error({required String message}) = _Error;
  const factory AuthBlocState.authenticated({
    required String userId,
    required String? displayName,
    required String? email,
    required String? photoUrl,
    required List<UserInfo> providerId,
    String? errorMessage,
  }) = AuthenticatedState;
}
