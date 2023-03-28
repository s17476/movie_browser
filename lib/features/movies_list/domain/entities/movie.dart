// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const Movie._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Movie({
    required String title,
    required double voteAverage,
    required int id,
    required dynamic posterPath,
    required dynamic releaseDate,
    required dynamic overview,
  }) = _Movie;

  factory Movie.initial() {
    return const Movie(
        title: '',
        voteAverage: 0,
        id: 0,
        posterPath: '',
        releaseDate: '',
        overview: '');
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
