// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      id: json['id'] as int,
      posterPath: json['posterPath'],
      releaseDate: json['releaseDate'],
      overview: json['overview'],
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'id': instance.id,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'overview': instance.overview,
    };
