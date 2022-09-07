part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool isSearching,
    required bool isLoading,
    required Option<Either<CloudFailure, List<Course>>> searchedCourses,
  }) = _SearchState;
  factory SearchState.initial() => _SearchState(
        isSearching: false,
        isLoading: false,
        searchedCourses: none(),
      );
}
