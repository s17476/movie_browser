// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TvShow _$TvShowFromJson(Map<String, dynamic> json) {
  return _TvShow.fromJson(json);
}

/// @nodoc
mixin _$TvShow {
  String get name => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  dynamic get posterPath => throw _privateConstructorUsedError;
  dynamic get firstAirDate => throw _privateConstructorUsedError;
  dynamic get overview => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TvShowCopyWith<TvShow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowCopyWith<$Res> {
  factory $TvShowCopyWith(TvShow value, $Res Function(TvShow) then) =
      _$TvShowCopyWithImpl<$Res, TvShow>;
  @useResult
  $Res call(
      {String name,
      double voteAverage,
      int id,
      dynamic posterPath,
      dynamic firstAirDate,
      dynamic overview});
}

/// @nodoc
class _$TvShowCopyWithImpl<$Res, $Val extends TvShow>
    implements $TvShowCopyWith<$Res> {
  _$TvShowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? voteAverage = null,
    Object? id = null,
    Object? posterPath = freezed,
    Object? firstAirDate = freezed,
    Object? overview = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TvShowCopyWith<$Res> implements $TvShowCopyWith<$Res> {
  factory _$$_TvShowCopyWith(_$_TvShow value, $Res Function(_$_TvShow) then) =
      __$$_TvShowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double voteAverage,
      int id,
      dynamic posterPath,
      dynamic firstAirDate,
      dynamic overview});
}

/// @nodoc
class __$$_TvShowCopyWithImpl<$Res>
    extends _$TvShowCopyWithImpl<$Res, _$_TvShow>
    implements _$$_TvShowCopyWith<$Res> {
  __$$_TvShowCopyWithImpl(_$_TvShow _value, $Res Function(_$_TvShow) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? voteAverage = null,
    Object? id = null,
    Object? posterPath = freezed,
    Object? firstAirDate = freezed,
    Object? overview = freezed,
  }) {
    return _then(_$_TvShow(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TvShow extends _TvShow with DiagnosticableTreeMixin {
  const _$_TvShow(
      {required this.name,
      required this.voteAverage,
      required this.id,
      required this.posterPath,
      required this.firstAirDate,
      required this.overview})
      : super._();

  factory _$_TvShow.fromJson(Map<String, dynamic> json) =>
      _$$_TvShowFromJson(json);

  @override
  final String name;
  @override
  final double voteAverage;
  @override
  final int id;
  @override
  final dynamic posterPath;
  @override
  final dynamic firstAirDate;
  @override
  final dynamic overview;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TvShow(name: $name, voteAverage: $voteAverage, id: $id, posterPath: $posterPath, firstAirDate: $firstAirDate, overview: $overview)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TvShow'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('voteAverage', voteAverage))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('posterPath', posterPath))
      ..add(DiagnosticsProperty('firstAirDate', firstAirDate))
      ..add(DiagnosticsProperty('overview', overview));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TvShow &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath) &&
            const DeepCollectionEquality()
                .equals(other.firstAirDate, firstAirDate) &&
            const DeepCollectionEquality().equals(other.overview, overview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      voteAverage,
      id,
      const DeepCollectionEquality().hash(posterPath),
      const DeepCollectionEquality().hash(firstAirDate),
      const DeepCollectionEquality().hash(overview));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TvShowCopyWith<_$_TvShow> get copyWith =>
      __$$_TvShowCopyWithImpl<_$_TvShow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TvShowToJson(
      this,
    );
  }
}

abstract class _TvShow extends TvShow {
  const factory _TvShow(
      {required final String name,
      required final double voteAverage,
      required final int id,
      required final dynamic posterPath,
      required final dynamic firstAirDate,
      required final dynamic overview}) = _$_TvShow;
  const _TvShow._() : super._();

  factory _TvShow.fromJson(Map<String, dynamic> json) = _$_TvShow.fromJson;

  @override
  String get name;
  @override
  double get voteAverage;
  @override
  int get id;
  @override
  dynamic get posterPath;
  @override
  dynamic get firstAirDate;
  @override
  dynamic get overview;
  @override
  @JsonKey(ignore: true)
  _$$_TvShowCopyWith<_$_TvShow> get copyWith =>
      throw _privateConstructorUsedError;
}
