// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';

part 'movie_genre_list.freezed.dart';
part 'movie_genre_list.g.dart';

@freezed
class MovieGenreList with _$MovieGenreList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieGenreList({
    required List<MovieGenre> genres,
  }) = _MovieGenreList;

  factory MovieGenreList.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreListFromJson(json);
}
