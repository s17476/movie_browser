part of 'apple_provider_cubit.dart';

@freezed
class AppleProviderState with _$AppleProviderState {
  const factory AppleProviderState.initial() = _Initial;
  const factory AppleProviderState.submitting() = _Submitting;
  const factory AppleProviderState.error({required String message}) = _Error;
  const factory AppleProviderState.submitted() = _Submitted;
}
