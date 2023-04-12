// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'person_details.freezed.dart';
part 'person_details.g.dart';

@freezed
class PersonDetails with _$PersonDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PersonDetails({
    required int id,
    required String name,
    required String biography,
    required String? birthday,
    required String? profilePath,
  }) = _PersonDetails;

  factory PersonDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsFromJson(json);
}
