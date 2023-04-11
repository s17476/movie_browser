// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_image.freezed.dart';
part 'movie_image.g.dart';

@freezed
class MovieImage with _$MovieImage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieImage({
    required String filePath,
  }) = _MovieImage;

  factory MovieImage.fromJson(Map<String, dynamic> json) =>
      _$MovieImageFromJson(json);
}
