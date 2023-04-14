part of 'email_provider_cubit.dart';

@freezed
class EmailProviderState with _$EmailProviderState {
  const factory EmailProviderState.initial() = _Initial;
  const factory EmailProviderState.submitting() = _Submitting;
  const factory EmailProviderState.error({required String message}) = _Error;
  const factory EmailProviderState.submitted() = _Submitted;
}
