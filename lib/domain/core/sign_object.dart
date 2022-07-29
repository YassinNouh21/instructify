import 'package:dartz/dartz.dart';

import 'package:instructify/domain/core/sign_form_failure.dart';

abstract class SignObject<T> {
  const SignObject();
  Either<SignFormFailure<T>, T> get value;

  T getUnExpectedFailure() {
    return value.fold(
        (f) => throw SignFormFailure.unExpectedFailure(failedValue: f),
        (value) => value);
  }

  @override
  String toString() => 'SignObject(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
