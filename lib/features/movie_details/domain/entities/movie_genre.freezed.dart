// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_genre.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieGenre _$MovieGenreFromJson(Map<String, dynamic> json) {
  return _MovieGenre.fromJson(json);
}

/// @nodoc
mixin _$MovieGenre {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieGenreCopyWith<MovieGenre> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieGenreCopyWith<$Res> {
  factory $MovieGenreCopyWith(
          MovieGenre value, $Res Function(MovieGenre) then) =
      _$MovieGenreCopyWithImpl<$Res, MovieGenre>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$MovieGenreCopyWithImpl<$Res, $Val extends MovieGenre>
    implements $MovieGenreCopyWith<$Res> {
  _$MovieGenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieGenreCopyWith<$Res>
    implements $MovieGenreCopyWith<$Res> {
  factory _$$_MovieGenreCopyWith(
          _$_MovieGenre value, $Res Function(_$_MovieGenre) then) =
      __$$_MovieGenreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_MovieGenreCopyWithImpl<$Res>
    extends _$MovieGenreCopyWithImpl<$Res, _$_MovieGenre>
    implements _$$_MovieGenreCopyWith<$Res> {
  __$$_MovieGenreCopyWithImpl(
      _$_MovieGenre _value, $Res Function(_$_MovieGenre) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_MovieGenre(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MovieGenre implements _MovieGenre {
  const _$_MovieGenre({required this.id, required this.name});

  factory _$_MovieGenre.fromJson(Map<String, dynamic> json) =>
      _$$_MovieGenreFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'MovieGenre(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieGenre &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieGenreCopyWith<_$_MovieGenre> get copyWith =>
      __$$_MovieGenreCopyWithImpl<_$_MovieGenre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieGenreToJson(
      this,
    );
  }
}

abstract class _MovieGenre implements MovieGenre {
  const factory _MovieGenre(
      {required final int id, required final String name}) = _$_MovieGenre;

  factory _MovieGenre.fromJson(Map<String, dynamic> json) =
      _$_MovieGenre.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_MovieGenreCopyWith<_$_MovieGenre> get copyWith =>
      throw _privateConstructorUsedError;
}
