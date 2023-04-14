part of 'auth_bloc_bloc.dart';

@freezed
class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.autoSignIn({required User user}) = _AutoSignIn;
  const factory AuthBlocEvent.signOut() = _SignOut;
}
