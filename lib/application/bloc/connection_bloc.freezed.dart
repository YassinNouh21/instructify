// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Check value) check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Check value)? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionEventCopyWith<$Res> {
  factory $ConnectionEventCopyWith(
          ConnectionEvent value, $Res Function(ConnectionEvent) then) =
      _$ConnectionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConnectionEventCopyWithImpl<$Res>
    implements $ConnectionEventCopyWith<$Res> {
  _$ConnectionEventCopyWithImpl(this._value, this._then);

  final ConnectionEvent _value;
  // ignore: unused_field
  final $Res Function(ConnectionEvent) _then;
}

/// @nodoc
abstract class _$$_CheckCopyWith<$Res> {
  factory _$$_CheckCopyWith(_$_Check value, $Res Function(_$_Check) then) =
      __$$_CheckCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CheckCopyWithImpl<$Res> extends _$ConnectionEventCopyWithImpl<$Res>
    implements _$$_CheckCopyWith<$Res> {
  __$$_CheckCopyWithImpl(_$_Check _value, $Res Function(_$_Check) _then)
      : super(_value, (v) => _then(v as _$_Check));

  @override
  _$_Check get _value => super._value as _$_Check;
}

/// @nodoc

class _$_Check implements _Check {
  const _$_Check();

  @override
  String toString() {
    return 'ConnectionEvent.check()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Check);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
  }) {
    return check();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? check,
  }) {
    return check?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Check value) check,
  }) {
    return check(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Check value)? check,
  }) {
    return check?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Check value)? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class _Check implements ConnectionEvent {
  const factory _Check() = _$_Check;
}

/// @nodoc
mixin _$ConnectionState {
  ConnectionStatus get status => throw _privateConstructorUsedError;
  ConnectionType get type => throw _privateConstructorUsedError;
  bool get isChecking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res>;
  $Res call({ConnectionStatus status, ConnectionType type, bool isChecking});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  final ConnectionState _value;
  // ignore: unused_field
  final $Res Function(ConnectionState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? isChecking = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
      isChecking: isChecking == freezed
          ? _value.isChecking
          : isChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ConnectionStateCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$$_ConnectionStateCopyWith(
          _$_ConnectionState value, $Res Function(_$_ConnectionState) then) =
      __$$_ConnectionStateCopyWithImpl<$Res>;
  @override
  $Res call({ConnectionStatus status, ConnectionType type, bool isChecking});
}

/// @nodoc
class __$$_ConnectionStateCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res>
    implements _$$_ConnectionStateCopyWith<$Res> {
  __$$_ConnectionStateCopyWithImpl(
      _$_ConnectionState _value, $Res Function(_$_ConnectionState) _then)
      : super(_value, (v) => _then(v as _$_ConnectionState));

  @override
  _$_ConnectionState get _value => super._value as _$_ConnectionState;

  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? isChecking = freezed,
  }) {
    return _then(_$_ConnectionState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConnectionType,
      isChecking: isChecking == freezed
          ? _value.isChecking
          : isChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ConnectionState implements _ConnectionState {
  const _$_ConnectionState(
      {required this.status, required this.type, required this.isChecking});

  @override
  final ConnectionStatus status;
  @override
  final ConnectionType type;
  @override
  final bool isChecking;

  @override
  String toString() {
    return 'ConnectionState(status: $status, type: $type, isChecking: $isChecking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.isChecking, isChecking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(isChecking));

  @JsonKey(ignore: true)
  @override
  _$$_ConnectionStateCopyWith<_$_ConnectionState> get copyWith =>
      __$$_ConnectionStateCopyWithImpl<_$_ConnectionState>(this, _$identity);
}

abstract class _ConnectionState implements ConnectionState {
  const factory _ConnectionState(
      {required final ConnectionStatus status,
      required final ConnectionType type,
      required final bool isChecking}) = _$_ConnectionState;

  @override
  ConnectionStatus get status;
  @override
  ConnectionType get type;
  @override
  bool get isChecking;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionStateCopyWith<_$_ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
