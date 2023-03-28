// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TvShow _$$_TvShowFromJson(Map<String, dynamic> json) => _$_TvShow(
      name: json['name'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: json['id'] as int,
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      overview: json['overview'],
    );

Map<String, dynamic> _$$_TvShowToJson(_$_TvShow instance) => <String, dynamic>{
      'name': instance.name,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'first_air_date': instance.firstAirDate,
      'overview': instance.overview,
    };
