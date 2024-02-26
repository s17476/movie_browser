// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movie_browser/features/movie_details/domain/entities/movie_genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieDetails({
    required int id,
    required bool adult,
    required double budget,
    required List<MovieGenre> genres,
    required String overview,
    required dynamic posterPath,
    required String releaseDate,
    required double revenue,
    required double runtime,
    required String tagline,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) = _Moviedetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
