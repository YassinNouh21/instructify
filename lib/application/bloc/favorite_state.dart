part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    required bool isLoading,
    required Option<Either<CloudFailure, List<Course>>> failureOrSuccess,
    required bool isEmpty,
  }) = _FavoriteState;
  factory FavoriteState.initial() => _FavoriteState(
      failureOrSuccess: none(), isEmpty: false, isLoading: false);
}
