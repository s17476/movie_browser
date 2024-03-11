// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieListImpl _$$MovieListImplFromJson(Map<String, dynamic> json) =>
    _$MovieListImpl(
      page: json['page'] ?? 'defaultValue',
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieListImplToJson(_$MovieListImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
