// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';

part 'person_credits.freezed.dart';
part 'person_credits.g.dart';

@freezed
class PersonCredits with _$PersonCredits {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PersonCredits({
    required List<Movie> cast,
  }) = _PersonCredits;

  factory PersonCredits.fromJson(Map<String, dynamic> json) =>
      _$PersonCreditsFromJson(json);
}
