// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return _MovieList.fromJson(json);
}

/// @nodoc
mixin _$MovieList {
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalResults => throw _privateConstructorUsedError;
  List<Movie> get results => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get lastQuery => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListCopyWith<MovieList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListCopyWith<$Res> {
  factory $MovieListCopyWith(MovieList value, $Res Function(MovieList) then) =
      _$MovieListCopyWithImpl<$Res, MovieList>;
  @useResult
  $Res call(
      {int page,
      int totalPages,
      int totalResults,
      List<Movie> results,
      @JsonKey(includeFromJson: false) String? lastQuery});
}

/// @nodoc
class _$MovieListCopyWithImpl<$Res, $Val extends MovieList>
    implements $MovieListCopyWith<$Res> {
  _$MovieListCopyWithImpl(this._value, this._then);

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
              as List<Movie>,
      lastQuery: freezed == lastQuery
          ? _value.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieListCopyWith<$Res> implements $MovieListCopyWith<$Res> {
  factory _$$_MovieListCopyWith(
          _$_MovieList value, $Res Function(_$_MovieList) then) =
      __$$_MovieListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int totalPages,
      int totalResults,
      List<Movie> results,
      @JsonKey(includeFromJson: false) String? lastQuery});
}

/// @nodoc
class __$$_MovieListCopyWithImpl<$Res>
    extends _$MovieListCopyWithImpl<$Res, _$_MovieList>
    implements _$$_MovieListCopyWith<$Res> {
  __$$_MovieListCopyWithImpl(
      _$_MovieList _value, $Res Function(_$_MovieList) _then)
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
    return _then(_$_MovieList(
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
              as List<Movie>,
      lastQuery: freezed == lastQuery
          ? _value.lastQuery
          : lastQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MovieList implements _MovieList {
  const _$_MovieList(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required final List<Movie> results,
      @JsonKey(includeFromJson: false) this.lastQuery})
      : _results = results;

  factory _$_MovieList.fromJson(Map<String, dynamic> json) =>
      _$$_MovieListFromJson(json);

  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalResults;
  final List<Movie> _results;
  @override
  List<Movie> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(includeFromJson: false)
  final String? lastQuery;

  @override
  String toString() {
    return 'MovieList(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results, lastQuery: $lastQuery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieList &&
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
  _$$_MovieListCopyWith<_$_MovieList> get copyWith =>
      __$$_MovieListCopyWithImpl<_$_MovieList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieListToJson(
      this,
    );
  }
}

abstract class _MovieList implements MovieList {
  const factory _MovieList(
      {required final int page,
      required final int totalPages,
      required final int totalResults,
      required final List<Movie> results,
      @JsonKey(includeFromJson: false) final String? lastQuery}) = _$_MovieList;

  factory _MovieList.fromJson(Map<String, dynamic> json) =
      _$_MovieList.fromJson;

  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalResults;
  @override
  List<Movie> get results;
  @override
  @JsonKey(includeFromJson: false)
  String? get lastQuery;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListCopyWith<_$_MovieList> get copyWith =>
      throw _privateConstructorUsedError;
}
