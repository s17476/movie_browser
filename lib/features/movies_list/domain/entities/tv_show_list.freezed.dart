// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvShowList _$TvShowListFromJson(Map<String, dynamic> json) {
  return _TvShowList.fromJson(json);
}

/// @nodoc
mixin _$TvShowList {
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<TvShow> get results => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get lastQuery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvShowListCopyWith<TvShowList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowListCopyWith<$Res> {
  factory $TvShowListCopyWith(
          TvShowList value, $Res Function(TvShowList) then) =
      _$TvShowListCopyWithImpl<$Res, TvShowList>;
  @useResult
  $Res call(
      {int page,
      int totalPages,
      int totalResults,
      List<TvShow> results,
      @JsonKey(includeFromJson: false) String? lastQuery});
}

/// @nodoc
class _$TvShowListCopyWithImpl<$Res, $Val extends TvShowList>
    implements $TvShowListCopyWith<$Res> {
  _$TvShowListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
    Object? lastQuery = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvShow>,
      lastQuery: freezed == lastQuery
          ? _value.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvShowListImplCopyWith<$Res>
    implements $TvShowListCopyWith<$Res> {
  factory _$$TvShowListImplCopyWith(
          _$TvShowListImpl value, $Res Function(_$TvShowListImpl) then) =
      __$$TvShowListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int totalPages,
      int totalResults,
      List<TvShow> results,
      @JsonKey(includeFromJson: false) String? lastQuery});
}

/// @nodoc
class __$$TvShowListImplCopyWithImpl<$Res>
    extends _$TvShowListCopyWithImpl<$Res, _$TvShowListImpl>
    implements _$$TvShowListImplCopyWith<$Res> {
  __$$TvShowListImplCopyWithImpl(
      _$TvShowListImpl _value, $Res Function(_$TvShowListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
    Object? lastQuery = freezed,
  }) {
    return _then(_$TvShowListImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvShow>,
      lastQuery: freezed == lastQuery
          ? _value.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TvShowListImpl implements _TvShowList {
  const _$TvShowListImpl(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required final List<TvShow> results,
      @JsonKey(includeFromJson: false) this.lastQuery})
      : _results = results;

  factory _$TvShowListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvShowListImplFromJson(json);

  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalResults;
  final List<TvShow> _results;
  @override
  List<TvShow> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(includeFromJson: false)
  final String? lastQuery;

  @override
  String toString() {
    return 'TvShowList(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results, lastQuery: $lastQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvShowListImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.lastQuery, lastQuery) ||
                other.lastQuery == lastQuery));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages, totalResults,
      const DeepCollectionEquality().hash(_results), lastQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvShowListImplCopyWith<_$TvShowListImpl> get copyWith =>
      __$$TvShowListImplCopyWithImpl<_$TvShowListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvShowListImplToJson(
      this,
    );
  }
}

abstract class _TvShowList implements TvShowList {
  const factory _TvShowList(
          {required final int page,
          required final int totalPages,
          required final int totalResults,
          required final List<TvShow> results,
          @JsonKey(includeFromJson: false) final String? lastQuery}) =
      _$TvShowListImpl;

  factory _TvShowList.fromJson(Map<String, dynamic> json) =
      _$TvShowListImpl.fromJson;

  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  List<TvShow> get results;
  @override
  @JsonKey(includeFromJson: false)
  String? get lastQuery;
  @override
  @JsonKey(ignore: true)
  _$$TvShowListImplCopyWith<_$TvShowListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
