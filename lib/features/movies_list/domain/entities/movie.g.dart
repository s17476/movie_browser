// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
    };
