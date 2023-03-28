// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_genre_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieGenreList _$MovieGenreListFromJson(Map<String, dynamic> json) {
  return _MovieGenreList.fromJson(json);
}

/// @nodoc
mixin _$MovieGenreList {
  List<MovieGenre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieGenreListCopyWith<MovieGenreList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieGenreListCopyWith<$Res> {
  factory $MovieGenreListCopyWith(
          MovieGenreList value, $Res Function(MovieGenreList) then) =
      _$MovieGenreListCopyWithImpl<$Res, MovieGenreList>;
  @useResult
  $Res call({List<MovieGenre> genres});
}

/// @nodoc
class _$MovieGenreListCopyWithImpl<$Res, $Val extends MovieGenreList>
    implements $MovieGenreListCopyWith<$Res> {
  _$MovieGenreListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieGenreListCopyWith<$Res>
    implements $MovieGenreListCopyWith<$Res> {
  factory _$$_MovieGenreListCopyWith(
          _$_MovieGenreList value, $Res Function(_$_MovieGenreList) then) =
      __$$_MovieGenreListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieGenre> genres});
}

/// @nodoc
class __$$_MovieGenreListCopyWithImpl<$Res>
    extends _$MovieGenreListCopyWithImpl<$Res, _$_MovieGenreList>
    implements _$$_MovieGenreListCopyWith<$Res> {
  __$$_MovieGenreListCopyWithImpl(
      _$_MovieGenreList _value, $Res Function(_$_MovieGenreList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$_MovieGenreList(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MovieGenreList implements _MovieGenreList {
  const _$_MovieGenreList({required final List<MovieGenre> genres})
      : _genres = genres;

  factory _$_MovieGenreList.fromJson(Map<String, dynamic> json) =>
      _$$_MovieGenreListFromJson(json);

  final List<MovieGenre> _genres;
  @override
  List<MovieGenre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'MovieGenreList(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieGenreList &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieGenreListCopyWith<_$_MovieGenreList> get copyWith =>
      __$$_MovieGenreListCopyWithImpl<_$_MovieGenreList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieGenreListToJson(
      this,
    );
  }
}

abstract class _MovieGenreList implements MovieGenreList {
  const factory _MovieGenreList({required final List<MovieGenre> genres}) =
      _$_MovieGenreList;

  factory _MovieGenreList.fromJson(Map<String, dynamic> json) =
      _$_MovieGenreList.fromJson;

  @override
  List<MovieGenre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$_MovieGenreListCopyWith<_$_MovieGenreList> get copyWith =>
      throw _privateConstructorUsedError;
}
