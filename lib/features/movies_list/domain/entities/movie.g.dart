// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: json['id'] as int,
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
    };
