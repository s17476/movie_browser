// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Moviedetails _$$_MoviedetailsFromJson(Map<String, dynamic> json) =>
    _$_Moviedetails(
      adult: json['adult'] as bool,
      budget: (json['budget'] as num).toDouble(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => MovieGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String,
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      runtime: (json['runtime'] as num).toDouble(),
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$$_MoviedetailsToJson(_$_Moviedetails instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
