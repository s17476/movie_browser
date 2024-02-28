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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$MovieGenreImplCopyWith<$Res>
    implements $MovieGenreCopyWith<$Res> {
  factory _$$MovieGenreImplCopyWith(
          _$MovieGenreImpl value, $Res Function(_$MovieGenreImpl) then) =
      __$$MovieGenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$MovieGenreImplCopyWithImpl<$Res>
    extends _$MovieGenreCopyWithImpl<$Res, _$MovieGenreImpl>
    implements _$$MovieGenreImplCopyWith<$Res> {
  __$$MovieGenreImplCopyWithImpl(
      _$MovieGenreImpl _value, $Res Function(_$MovieGenreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$MovieGenreImpl(
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
class _$MovieGenreImpl implements _MovieGenre {
  const _$MovieGenreImpl({required this.id, required this.name});

  factory _$MovieGenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieGenreImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'MovieGenre(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieGenreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieGenreImplCopyWith<_$MovieGenreImpl> get copyWith =>
      __$$MovieGenreImplCopyWithImpl<_$MovieGenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieGenreImplToJson(
      this,
    );
  }
}

abstract class _MovieGenre implements MovieGenre {
  const factory _MovieGenre(
      {required final int id, required final String name}) = _$MovieGenreImpl;

  factory _MovieGenre.fromJson(Map<String, dynamic> json) =
      _$MovieGenreImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MovieGenreImplCopyWith<_$MovieGenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
