// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_browser/features/movie_details/domain/entities/actor.dart';

part 'credits.freezed.dart';
part 'credits.g.dart';

@freezed
class Credits with _$Credits {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Credits({
    required int id,
    required List<Actor> cast,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);
}
