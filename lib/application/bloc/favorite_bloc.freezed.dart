// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteEvent {
  List<String> get courseIds => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> courseIds) favoriteCoursesPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> courseIds)? favoriteCoursesPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> courseIds)? favoriteCoursesPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteCoursesPressed value)
        favoriteCoursesPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FavoriteCoursesPressed value)? favoriteCoursesPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteCoursesPressed value)? favoriteCoursesPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteEventCopyWith<FavoriteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
          FavoriteEvent value, $Res Function(FavoriteEvent) then) =
      _$FavoriteEventCopyWithImpl<$Res>;
  $Res call({List<String> courseIds});
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  final FavoriteEvent _value;
  // ignore: unused_field
  final $Res Function(FavoriteEvent) _then;

  @override
  $Res call({
    Object? courseIds = freezed,
  }) {
    return _then(_value.copyWith(
      courseIds: courseIds == freezed
          ? _value.courseIds
          : courseIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteCoursesPressedCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory _$$_FavoriteCoursesPressedCopyWith(_$_FavoriteCoursesPressed value,
          $Res Function(_$_FavoriteCoursesPressed) then) =
      __$$_FavoriteCoursesPressedCopyWithImpl<$Res>;
  @override
  $Res call({List<String> courseIds});
}

/// @nodoc
class __$$_FavoriteCoursesPressedCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res>
    implements _$$_FavoriteCoursesPressedCopyWith<$Res> {
  __$$_FavoriteCoursesPressedCopyWithImpl(_$_FavoriteCoursesPressed _value,
      $Res Function(_$_FavoriteCoursesPressed) _then)
      : super(_value, (v) => _then(v as _$_FavoriteCoursesPressed));

  @override
  _$_FavoriteCoursesPressed get _value =>
      super._value as _$_FavoriteCoursesPressed;

  @override
  $Res call({
    Object? courseIds = freezed,
  }) {
    return _then(_$_FavoriteCoursesPressed(
      courseIds == freezed
          ? _value._courseIds
          : courseIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FavoriteCoursesPressed implements _FavoriteCoursesPressed {
  const _$_FavoriteCoursesPressed(final List<String> courseIds)
      : _courseIds = courseIds;

  final List<String> _courseIds;
  @override
  List<String> get courseIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courseIds);
  }

  @override
  String toString() {
    return 'FavoriteEvent.favoriteCoursesPressed(courseIds: $courseIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteCoursesPressed &&
            const DeepCollectionEquality()
                .equals(other._courseIds, _courseIds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courseIds));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteCoursesPressedCopyWith<_$_FavoriteCoursesPressed> get copyWith =>
      __$$_FavoriteCoursesPressedCopyWithImpl<_$_FavoriteCoursesPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> courseIds) favoriteCoursesPressed,
  }) {
    return favoriteCoursesPressed(courseIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<String> courseIds)? favoriteCoursesPressed,
  }) {
    return favoriteCoursesPressed?.call(courseIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> courseIds)? favoriteCoursesPressed,
    required TResult orElse(),
  }) {
    if (favoriteCoursesPressed != null) {
      return favoriteCoursesPressed(courseIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FavoriteCoursesPressed value)
        favoriteCoursesPressed,
  }) {
    return favoriteCoursesPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FavoriteCoursesPressed value)? favoriteCoursesPressed,
  }) {
    return favoriteCoursesPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FavoriteCoursesPressed value)? favoriteCoursesPressed,
    required TResult orElse(),
  }) {
    if (favoriteCoursesPressed != null) {
      return favoriteCoursesPressed(this);
    }
    return orElse();
  }
}

abstract class _FavoriteCoursesPressed implements FavoriteEvent {
  const factory _FavoriteCoursesPressed(final List<String> courseIds) =
      _$_FavoriteCoursesPressed;

  @override
  List<String> get courseIds;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCoursesPressedCopyWith<_$_FavoriteCoursesPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<CloudFailure, List<Course>>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get isEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Option<Either<CloudFailure, List<Course>>> failureOrSuccess,
      bool isEmpty});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  final FavoriteState _value;
  // ignore: unused_field
  final $Res Function(FavoriteState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureOrSuccess = freezed,
    Object? isEmpty = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Course>>>,
      isEmpty: isEmpty == freezed
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$_FavoriteStateCopyWith(
          _$_FavoriteState value, $Res Function(_$_FavoriteState) then) =
      __$$_FavoriteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Option<Either<CloudFailure, List<Course>>> failureOrSuccess,
      bool isEmpty});
}

/// @nodoc
class __$$_FavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements _$$_FavoriteStateCopyWith<$Res> {
  __$$_FavoriteStateCopyWithImpl(
      _$_FavoriteState _value, $Res Function(_$_FavoriteState) _then)
      : super(_value, (v) => _then(v as _$_FavoriteState));

  @override
  _$_FavoriteState get _value => super._value as _$_FavoriteState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? failureOrSuccess = freezed,
    Object? isEmpty = freezed,
  }) {
    return _then(_$_FavoriteState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: failureOrSuccess == freezed
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Course>>>,
      isEmpty: isEmpty == freezed
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavoriteState implements _FavoriteState {
  const _$_FavoriteState(
      {required this.isLoading,
      required this.failureOrSuccess,
      required this.isEmpty});

  @override
  final bool isLoading;
  @override
  final Option<Either<CloudFailure, List<Course>>> failureOrSuccess;
  @override
  final bool isEmpty;

  @override
  String toString() {
    return 'FavoriteState(isLoading: $isLoading, failureOrSuccess: $failureOrSuccess, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccess, failureOrSuccess) &&
            const DeepCollectionEquality().equals(other.isEmpty, isEmpty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(failureOrSuccess),
      const DeepCollectionEquality().hash(isEmpty));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      __$$_FavoriteStateCopyWithImpl<_$_FavoriteState>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {required final bool isLoading,
      required final Option<Either<CloudFailure, List<Course>>>
          failureOrSuccess,
      required final bool isEmpty}) = _$_FavoriteState;

  @override
  bool get isLoading;
  @override
  Option<Either<CloudFailure, List<Course>>> get failureOrSuccess;
  @override
  bool get isEmpty;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
