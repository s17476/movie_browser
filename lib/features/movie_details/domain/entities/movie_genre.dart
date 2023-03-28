// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_genre.freezed.dart';
part 'movie_genre.g.dart';

@freezed
class MovieGenre with _$MovieGenre {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieGenre({
    required int id,
    required String name,
  }) = _MovieGenre;

  factory MovieGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreFromJson(json);
}
