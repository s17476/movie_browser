// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Actor({
    required int id,
    required String name,
    required String? profilePath,
    required String character,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
