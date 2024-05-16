// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvShowImpl _$$TvShowImplFromJson(Map<String, dynamic> json) => _$TvShowImpl(
      name: json['name'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      overview: json['overview'],
    );

Map<String, dynamic> _$$TvShowImplToJson(_$TvShowImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vote_average': instance.voteAverage,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'first_air_date': instance.firstAirDate,
      'overview': instance.overview,
    };
