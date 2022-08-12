// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cloud_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CloudFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() objectServerError,
    required TResult Function() unauthorized,
    required TResult Function() objectNotFound,
    required TResult Function() unkown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ObjectServerError value) objectServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(Unknown value) unkown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudFailureCopyWith<$Res> {
  factory $CloudFailureCopyWith(
          CloudFailure value, $Res Function(CloudFailure) then) =
      _$CloudFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CloudFailureCopyWithImpl<$Res> implements $CloudFailureCopyWith<$Res> {
  _$CloudFailureCopyWithImpl(this._value, this._then);

  final CloudFailure _value;
  // ignore: unused_field
  final $Res Function(CloudFailure) _then;
}

/// @nodoc
abstract class _$$ObjectServerErrorCopyWith<$Res> {
  factory _$$ObjectServerErrorCopyWith(
          _$ObjectServerError value, $Res Function(_$ObjectServerError) then) =
      __$$ObjectServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ObjectServerErrorCopyWithImpl<$Res>
    extends _$CloudFailureCopyWithImpl<$Res>
    implements _$$ObjectServerErrorCopyWith<$Res> {
  __$$ObjectServerErrorCopyWithImpl(
      _$ObjectServerError _value, $Res Function(_$ObjectServerError) _then)
      : super(_value, (v) => _then(v as _$ObjectServerError));

  @override
  _$ObjectServerError get _value => super._value as _$ObjectServerError;
}

/// @nodoc

class _$ObjectServerError implements ObjectServerError {
  const _$ObjectServerError();

  @override
  String toString() {
    return 'CloudFailure.objectServerError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ObjectServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() objectServerError,
    required TResult Function() unauthorized,
    required TResult Function() objectNotFound,
    required TResult Function() unkown,
  }) {
    return objectServerError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
  }) {
    return objectServerError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
    required TResult orElse(),
  }) {
    if (objectServerError != null) {
      return objectServerError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ObjectServerError value) objectServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(Unknown value) unkown,
  }) {
    return objectServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
  }) {
    return objectServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
    required TResult orElse(),
  }) {
    if (objectServerError != null) {
      return objectServerError(this);
    }
    return orElse();
  }
}

abstract class ObjectServerError implements CloudFailure {
  const factory ObjectServerError() = _$ObjectServerError;
}

/// @nodoc
abstract class _$$UnauthorizedCopyWith<$Res> {
  factory _$$UnauthorizedCopyWith(
          _$Unauthorized value, $Res Function(_$Unauthorized) then) =
      __$$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedCopyWithImpl<$Res>
    extends _$CloudFailureCopyWithImpl<$Res>
    implements _$$UnauthorizedCopyWith<$Res> {
  __$$UnauthorizedCopyWithImpl(
      _$Unauthorized _value, $Res Function(_$Unauthorized) _then)
      : super(_value, (v) => _then(v as _$Unauthorized));

  @override
  _$Unauthorized get _value => super._value as _$Unauthorized;
}

/// @nodoc

class _$Unauthorized implements Unauthorized {
  const _$Unauthorized();

  @override
  String toString() {
    return 'CloudFailure.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() objectServerError,
    required TResult Function() unauthorized,
    required TResult Function() objectNotFound,
    required TResult Function() unkown,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ObjectServerError value) objectServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(Unknown value) unkown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements CloudFailure {
  const factory Unauthorized() = _$Unauthorized;
}

/// @nodoc
abstract class _$$ObjectNotFoundCopyWith<$Res> {
  factory _$$ObjectNotFoundCopyWith(
          _$ObjectNotFound value, $Res Function(_$ObjectNotFound) then) =
      __$$ObjectNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ObjectNotFoundCopyWithImpl<$Res>
    extends _$CloudFailureCopyWithImpl<$Res>
    implements _$$ObjectNotFoundCopyWith<$Res> {
  __$$ObjectNotFoundCopyWithImpl(
      _$ObjectNotFound _value, $Res Function(_$ObjectNotFound) _then)
      : super(_value, (v) => _then(v as _$ObjectNotFound));

  @override
  _$ObjectNotFound get _value => super._value as _$ObjectNotFound;
}

/// @nodoc

class _$ObjectNotFound implements ObjectNotFound {
  const _$ObjectNotFound();

  @override
  String toString() {
    return 'CloudFailure.objectNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ObjectNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() objectServerError,
    required TResult Function() unauthorized,
    required TResult Function() objectNotFound,
    required TResult Function() unkown,
  }) {
    return objectNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
  }) {
    return objectNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
    required TResult orElse(),
  }) {
    if (objectNotFound != null) {
      return objectNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ObjectServerError value) objectServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(Unknown value) unkown,
  }) {
    return objectNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
  }) {
    return objectNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
    required TResult orElse(),
  }) {
    if (objectNotFound != null) {
      return objectNotFound(this);
    }
    return orElse();
  }
}

abstract class ObjectNotFound implements CloudFailure {
  const factory ObjectNotFound() = _$ObjectNotFound;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res> extends _$CloudFailureCopyWithImpl<$Res>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, (v) => _then(v as _$Unknown));

  @override
  _$Unknown get _value => super._value as _$Unknown;
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'CloudFailure.unkown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() objectServerError,
    required TResult Function() unauthorized,
    required TResult Function() objectNotFound,
    required TResult Function() unkown,
  }) {
    return unkown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
  }) {
    return unkown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? objectServerError,
    TResult Function()? unauthorized,
    TResult Function()? objectNotFound,
    TResult Function()? unkown,
    required TResult orElse(),
  }) {
    if (unkown != null) {
      return unkown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ObjectServerError value) objectServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(ObjectNotFound value) objectNotFound,
    required TResult Function(Unknown value) unkown,
  }) {
    return unkown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
  }) {
    return unkown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ObjectServerError value)? objectServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(ObjectNotFound value)? objectNotFound,
    TResult Function(Unknown value)? unkown,
    required TResult orElse(),
  }) {
    if (unkown != null) {
      return unkown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements CloudFailure {
  const factory Unknown() = _$Unknown;
}
