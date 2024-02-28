// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genre_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieGenreListImpl _$$MovieGenreListImplFromJson(Map<String, dynamic> json) =>
    _$MovieGenreListImpl(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => MovieGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieGenreListImplToJson(
        _$MovieGenreListImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
