// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvShowListImpl _$$TvShowListImplFromJson(Map<String, dynamic> json) =>
    _$TvShowListImpl(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TvShowListImplToJson(_$TvShowListImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
