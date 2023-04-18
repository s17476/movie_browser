part of 'facebook_provider_cubit.dart';

@freezed
class FacebookProviderState with _$FacebookProviderState {
  const factory FacebookProviderState.initial() = _Initial;
  const factory FacebookProviderState.submitting() = _Submitting;
  const factory FacebookProviderState.error({required String message}) = _Error;
  const factory FacebookProviderState.submitted() = _Submitted;
}
