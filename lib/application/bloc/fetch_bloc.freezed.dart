// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<CloudFailure, List<Object>>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  DataType get dataType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchStateCopyWith<FetchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchStateCopyWith<$Res> {
  factory $FetchStateCopyWith(
          FetchState value, $Res Function(FetchState) then) =
      _$FetchStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Option<Either<CloudFailure, List<Object>>> failureOrSuccess,
      bool isSuccess,
      DataType dataType});
}

/// @nodoc
class _$FetchStateCopyWithImpl<$Res> implements $FetchStateCopyWith<$Res> {
  _$FetchStateCopyWithImpl(this._value, this._then);

  final FetchState _value;
  // ignore: unused_field
  final $Res Function(FetchState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureOrSuccess = freezed,
    Object? isSuccess = freezed,
    Object? dataType = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Object>>>,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      dataType: dataType == freezed
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
    ));
  }
}

/// @nodoc
abstract class _$$_FetchStateCopyWith<$Res>
    implements $FetchStateCopyWith<$Res> {
  factory _$$_FetchStateCopyWith(
          _$_FetchState value, $Res Function(_$_FetchState) then) =
      __$$_FetchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Option<Either<CloudFailure, List<Object>>> failureOrSuccess,
      bool isSuccess,
      DataType dataType});
}

/// @nodoc
class __$$_FetchStateCopyWithImpl<$Res> extends _$FetchStateCopyWithImpl<$Res>
    implements _$$_FetchStateCopyWith<$Res> {
  __$$_FetchStateCopyWithImpl(
      _$_FetchState _value, $Res Function(_$_FetchState) _then)
      : super(_value, (v) => _then(v as _$_FetchState));

  @override
  _$_FetchState get _value => super._value as _$_FetchState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureOrSuccess = freezed,
    Object? isSuccess = freezed,
    Object? dataType = freezed,
  }) {
    return _then(_$_FetchState(
      isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Object>>>,
      isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      dataType == freezed
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataType,
    ));
  }
}

/// @nodoc

class _$_FetchState implements _FetchState {
  const _$_FetchState(
      this.isLoading, this.failureOrSuccess, this.isSuccess, this.dataType);

  @override
  final bool isLoading;
  @override
  final Option<Either<CloudFailure, List<Object>>> failureOrSuccess;
  @override
  final bool isSuccess;
  @override
  final DataType dataType;

  @override
  String toString() {
    return 'FetchState(isLoading: $isLoading, failureOrSuccess: $failureOrSuccess, isSuccess: $isSuccess, dataType: $dataType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccess, failureOrSuccess) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.dataType, dataType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failureOrSuccess),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(dataType));

  @JsonKey(ignore: true)
  @override
  _$$_FetchStateCopyWith<_$_FetchState> get copyWith =>
      __$$_FetchStateCopyWithImpl<_$_FetchState>(this, _$identity);
}

abstract class _FetchState implements FetchState {
  const factory _FetchState(
      final bool isLoading,
      final Option<Either<CloudFailure, List<Object>>> failureOrSuccess,
      final bool isSuccess,
      final DataType dataType) = _$_FetchState;

  @override
  bool get isLoading;
  @override
  Option<Either<CloudFailure, List<Object>>> get failureOrSuccess;
  @override
  bool get isSuccess;
  @override
  DataType get dataType;
  @override
  @JsonKey(ignore: true)
  _$$_FetchStateCopyWith<_$_FetchState> get copyWith =>
      throw _privateConstructorUsedError;
}
