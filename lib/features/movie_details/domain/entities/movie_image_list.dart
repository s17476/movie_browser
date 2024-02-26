// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_image.dart';

part 'movie_image_list.freezed.dart';
part 'movie_image_list.g.dart';

@freezed
class MovieImageList with _$MovieImageList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieImageList({
    required int id,
    required List<MovieImage> backdrops,
    required List<MovieImage> posters,
  }) = _MovieImageList;

  factory MovieImageList.fromJson(Map<String, dynamic> json) =>
      _$MovieImageListFromJson(json);
}
