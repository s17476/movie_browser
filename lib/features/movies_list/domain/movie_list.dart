// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie.dart';

part 'movie_list.freezed.dart';
part 'movie_list.g.dart';

@freezed
class MovieList with _$MovieList {
  const factory MovieList({
    required int page,
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

  // // Sets query used to fetch current movie list.
  // set query(String query) => this.lastQuery = query;

  // // Adds next result page to corrent movie list.
  // void addNextResultsPage(MovieList movieList) {
  //   this.page = movieList.page;
  //   this.results.addAll(movieList.results);
  // }
}
