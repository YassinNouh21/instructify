part of 'fetch_bloc.dart';

enum DataType {
  Course,
  Category,
}

@freezed
class FetchState with _$FetchState {
  const factory FetchState(
    bool isLoading,
    Option<Either<CloudFailure, List<Object>>> failureOrSuccess,
    bool isSuccess,
    DataType dataType,
  ) = _FetchState;

  factory FetchState.initial() => _FetchState(
        true,
        none(),
        true,
        DataType.Course,
      );
}
