// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_genre.dart';

part 'tv_show_details.freezed.dart';
part 'tv_show_details.g.dart';

@freezed
class TvShowDetails with _$TvShowDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TvShowDetails({
    required int id,
    required String name,
    required String overview,
    required String firstAirDate,
    required List<MovieGenre> genres,
    required int numberOfSeasons,
    required int numberOfEpisodes,
    required String? posterPath,
    required String status,
    required String tagline,
    required double voteAverage,
    required int voteCount,
  }) = _TvShowdetails;

  factory TvShowDetails.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsFromJson(json);
}
