// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_browser/features/movie_details/domain/entities/video.dart';

part 'video_list.freezed.dart';
part 'video_list.g.dart';

@freezed
class VideoList with _$VideoList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VideoList({
    required int id,
    required List<Video> results,
  }) = _VideoList;

  factory VideoList.fromJson(Map<String, dynamic> json) =>
      _$VideoListFromJson(json);
}
