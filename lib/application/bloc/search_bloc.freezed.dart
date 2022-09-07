// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  String get keyword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) searched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyword)? searched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? searched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searched value) searched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Searched value)? searched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searched value)? searched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res>;
  $Res call({String keyword});
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res> implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  final SearchEvent _value;
  // ignore: unused_field
  final $Res Function(SearchEvent) _then;

  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$_SearchedCopyWith(
          _$_Searched value, $Res Function(_$_Searched) then) =
      __$$_SearchedCopyWithImpl<$Res>;
  @override
  $Res call({String keyword});
}

/// @nodoc
class __$$_SearchedCopyWithImpl<$Res> extends _$SearchEventCopyWithImpl<$Res>
    implements _$$_SearchedCopyWith<$Res> {
  __$$_SearchedCopyWithImpl(
      _$_Searched _value, $Res Function(_$_Searched) _then)
      : super(_value, (v) => _then(v as _$_Searched));

  @override
  _$_Searched get _value => super._value as _$_Searched;

  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_$_Searched(
      keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Searched implements _Searched {
  const _$_Searched(this.keyword);

  @override
  final String keyword;

  @override
  String toString() {
    return 'SearchEvent.searched(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Searched &&
            const DeepCollectionEquality().equals(other.keyword, keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(keyword));

  @JsonKey(ignore: true)
  @override
  _$$_SearchedCopyWith<_$_Searched> get copyWith =>
      __$$_SearchedCopyWithImpl<_$_Searched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String keyword) searched,
  }) {
    return searched(keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String keyword)? searched,
  }) {
    return searched?.call(keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String keyword)? searched,
    required TResult orElse(),
  }) {
    if (searched != null) {
      return searched(keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Searched value) searched,
  }) {
    return searched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Searched value)? searched,
  }) {
    return searched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Searched value)? searched,
    required TResult orElse(),
  }) {
    if (searched != null) {
      return searched(this);
    }
    return orElse();
  }
}

abstract class _Searched implements SearchEvent {
  const factory _Searched(final String keyword) = _$_Searched;

  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_SearchedCopyWith<_$_Searched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<CloudFailure, List<Course>>> get searchedCourses =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSearching,
      bool isLoading,
      Option<Either<CloudFailure, List<Course>>> searchedCourses});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? isSearching = freezed,
    Object? isLoading = freezed,
    Object? searchedCourses = freezed,
  }) {
    return _then(_value.copyWith(
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedCourses: searchedCourses == freezed
          ? _value.searchedCourses
          : searchedCourses // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Course>>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSearching,
      bool isLoading,
      Option<Either<CloudFailure, List<Course>>> searchedCourses});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? isSearching = freezed,
    Object? isLoading = freezed,
    Object? searchedCourses = freezed,
  }) {
    return _then(_$_SearchState(
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedCourses: searchedCourses == freezed
          ? _value.searchedCourses
          : searchedCourses // ignore: cast_nullable_to_non_nullable
              as Option<Either<CloudFailure, List<Course>>>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required this.isSearching,
      required this.isLoading,
      required this.searchedCourses});

  @override
  final bool isSearching;
  @override
  final bool isLoading;
  @override
  final Option<Either<CloudFailure, List<Course>>> searchedCourses;

  @override
  String toString() {
    return 'SearchState(isSearching: $isSearching, isLoading: $isLoading, searchedCourses: $searchedCourses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other.isSearching, isSearching) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.searchedCourses, searchedCourses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSearching),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(searchedCourses));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final bool isSearching,
      required final bool isLoading,
      required final Option<Either<CloudFailure, List<Course>>>
          searchedCourses}) = _$_SearchState;

  @override
  bool get isSearching;
  @override
  bool get isLoading;
  @override
  Option<Either<CloudFailure, List<Course>>> get searchedCourses;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
