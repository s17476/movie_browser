// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TvShowList _$$_TvShowListFromJson(Map<String, dynamic> json) =>
    _$_TvShowList(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TvShowListToJson(_$_TvShowList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
