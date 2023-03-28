// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'tv_show.freezed.dart';
part 'tv_show.g.dart';

@freezed
class TvShow with _$TvShow {
  const TvShow._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TvShow({
    required String name,
    required double voteAverage,
    required int id,
    required dynamic posterPath,
    required dynamic firstAirDate,
    required dynamic overview,
  }) = _TvShow;

  factory TvShow.initial() {
    return const TvShow(
        name: '',
        voteAverage: 0,
        id: 0,
        posterPath: '',
        firstAirDate: '',
        overview: '');
  }

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);
}
