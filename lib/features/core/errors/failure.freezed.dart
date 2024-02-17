// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message) auth,
    required TResult Function(String message) cancelledByUser,
    required TResult Function(String message) userNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? cancelledByUser,
    TResult? Function(String message)? userNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message)? auth,
    TResult Function(String message)? cancelledByUser,
    TResult Function(String message)? userNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_Auth value) auth,
    required TResult Function(_CancelledByUser value) cancelledByUser,
    required TResult Function(_UserNotFound value) userNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_General value)? general,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_CancelledByUser value)? cancelledByUser,
    TResult? Function(_UserNotFound value)? userNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_Auth value)? auth,
    TResult Function(_CancelledByUser value)? cancelledByUser,
    TResult Function(_UserNotFound value)? userNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$GeneralImplCopyWith(
          _$GeneralImpl value, $Res Function(_$GeneralImpl) then) =
      __$$GeneralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeneralImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GeneralImpl>
    implements _$$GeneralImplCopyWith<$Res> {
  __$$GeneralImplCopyWithImpl(
      _$GeneralImpl _value, $Res Function(_$GeneralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GeneralImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneralImpl implements _General {
  const _$GeneralImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.general(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralImplCopyWith<_$GeneralImpl> get copyWith =>
      __$$GeneralImplCopyWithImpl<_$GeneralImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message) auth,
    required TResult Function(String message) cancelledByUser,
    required TResult Function(String message) userNotFound,
  }) {
    return general(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? cancelledByUser,
    TResult? Function(String message)? userNotFound,
  }) {
    return general?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message)? auth,
    TResult Function(String message)? cancelledByUser,
    TResult Function(String message)? userNotFound,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_Auth value) auth,
    required TResult Function(_CancelledByUser value) cancelledByUser,
    required TResult Function(_UserNotFound value) userNotFound,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_General value)? general,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_CancelledByUser value)? cancelledByUser,
    TResult? Function(_UserNotFound value)? userNotFound,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_Auth value)? auth,
    TResult Function(_CancelledByUser value)? cancelledByUser,
    TResult Function(_UserNotFound value)? userNotFound,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class _General implements Failure {
  const factory _General({required final String message}) = _$GeneralImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$GeneralImplCopyWith<_$GeneralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthImpl implements _Auth {
  const _$AuthImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.auth(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message) auth,
    required TResult Function(String message) cancelledByUser,
    required TResult Function(String message) userNotFound,
  }) {
    return auth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? cancelledByUser,
    TResult? Function(String message)? userNotFound,
  }) {
    return auth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message)? auth,
    TResult Function(String message)? cancelledByUser,
    TResult Function(String message)? userNotFound,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_Auth value) auth,
    required TResult Function(_CancelledByUser value) cancelledByUser,
    required TResult Function(_UserNotFound value) userNotFound,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_General value)? general,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_CancelledByUser value)? cancelledByUser,
    TResult? Function(_UserNotFound value)? userNotFound,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_Auth value)? auth,
    TResult Function(_CancelledByUser value)? cancelledByUser,
    TResult Function(_UserNotFound value)? userNotFound,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _Auth implements Failure {
  const factory _Auth({required final String message}) = _$AuthImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledByUserImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CancelledByUserImplCopyWith(_$CancelledByUserImpl value,
          $Res Function(_$CancelledByUserImpl) then) =
      __$$CancelledByUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CancelledByUserImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CancelledByUserImpl>
    implements _$$CancelledByUserImplCopyWith<$Res> {
  __$$CancelledByUserImplCopyWithImpl(
      _$CancelledByUserImpl _value, $Res Function(_$CancelledByUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CancelledByUserImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelledByUserImpl implements _CancelledByUser {
  const _$CancelledByUserImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cancelledByUser(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledByUserImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledByUserImplCopyWith<_$CancelledByUserImpl> get copyWith =>
      __$$CancelledByUserImplCopyWithImpl<_$CancelledByUserImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message) auth,
    required TResult Function(String message) cancelledByUser,
    required TResult Function(String message) userNotFound,
  }) {
    return cancelledByUser(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? cancelledByUser,
    TResult? Function(String message)? userNotFound,
  }) {
    return cancelledByUser?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message)? auth,
    TResult Function(String message)? cancelledByUser,
    TResult Function(String message)? userNotFound,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_Auth value) auth,
    required TResult Function(_CancelledByUser value) cancelledByUser,
    required TResult Function(_UserNotFound value) userNotFound,
  }) {
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_General value)? general,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_CancelledByUser value)? cancelledByUser,
    TResult? Function(_UserNotFound value)? userNotFound,
  }) {
    return cancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_Auth value)? auth,
    TResult Function(_CancelledByUser value)? cancelledByUser,
    TResult Function(_UserNotFound value)? userNotFound,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class _CancelledByUser implements Failure {
  const factory _CancelledByUser({required final String message}) =
      _$CancelledByUserImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CancelledByUserImplCopyWith<_$CancelledByUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserNotFoundImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UserNotFoundImplCopyWith(
          _$UserNotFoundImpl value, $Res Function(_$UserNotFoundImpl) then) =
      __$$UserNotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserNotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UserNotFoundImpl>
    implements _$$UserNotFoundImplCopyWith<$Res> {
  __$$UserNotFoundImplCopyWithImpl(
      _$UserNotFoundImpl _value, $Res Function(_$UserNotFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserNotFoundImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserNotFoundImpl implements _UserNotFound {
  const _$UserNotFoundImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.userNotFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      __$$UserNotFoundImplCopyWithImpl<_$UserNotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message) auth,
    required TResult Function(String message) cancelledByUser,
    required TResult Function(String message) userNotFound,
  }) {
    return userNotFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? cancelledByUser,
    TResult? Function(String message)? userNotFound,
  }) {
    return userNotFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message)? auth,
    TResult Function(String message)? cancelledByUser,
    TResult Function(String message)? userNotFound,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_General value) general,
    required TResult Function(_Auth value) auth,
    required TResult Function(_CancelledByUser value) cancelledByUser,
    required TResult Function(_UserNotFound value) userNotFound,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_General value)? general,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_CancelledByUser value)? cancelledByUser,
    TResult? Function(_UserNotFound value)? userNotFound,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_General value)? general,
    TResult Function(_Auth value)? auth,
    TResult Function(_CancelledByUser value)? cancelledByUser,
    TResult Function(_UserNotFound value)? userNotFound,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _UserNotFound implements Failure {
  const factory _UserNotFound({required final String message}) =
      _$UserNotFoundImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UserNotFoundImplCopyWith<_$UserNotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
