part of 'google_provider_cubit.dart';

@freezed
class GoogleProviderState with _$GoogleProviderState {
  const factory GoogleProviderState.initial() = _Initial;
  const factory GoogleProviderState.submitting() = _Submitting;
  const factory GoogleProviderState.error({required String message}) = _Error;
  const factory GoogleProviderState.submitted() = _Submitted;
}
