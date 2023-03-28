// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'tv_show.dart';

part 'tv_show_list.freezed.dart';
part 'tv_show_list.g.dart';

@freezed
class TvShowList with _$TvShowList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TvShowList({
    required int page,
    required int totalPages,
    required int totalResults,
    required List<TvShow> results,
    @JsonKey(includeFromJson: false) String? lastQuery,
  }) = _TvShowList;

  factory TvShowList.initial() {
    return const TvShowList(
      page: 0,
      totalPages: 0,
      totalResults: 0,
      results: [],
      lastQuery: '',
    );
  }

  factory TvShowList.fromJson(Map<String, dynamic> json) =>
      _$TvShowListFromJson(json);
}
