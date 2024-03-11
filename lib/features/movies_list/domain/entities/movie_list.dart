// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_browser/features/movies_list/domain/entities/movie.dart';

part 'movie_list.freezed.dart';
part 'movie_list.g.dart';

@freezed
class MovieList with _$MovieList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieList({
    @Default('defaultValue') page,
    required int totalPages,
    required int totalResults,
    required List<Movie> results,
    @JsonKey(includeFromJson: false) String? lastQuery,
  }) = _MovieList;

  factory MovieList.initial() {
    return const MovieList(
      page: 0,
      totalPages: 0,
      totalResults: 0,
      results: [],
      lastQuery: '',
    );
  }

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
}
