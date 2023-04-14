import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  /// General failures
  const factory Failure.general({required String message}) = _General;

  /// Authentication service failure
  const factory Failure.auth({required String message}) = _Auth;
}
