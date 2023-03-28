// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genre_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieGenreList _$$_MovieGenreListFromJson(Map<String, dynamic> json) =>
    _$_MovieGenreList(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => MovieGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieGenreListToJson(_$_MovieGenreList instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
