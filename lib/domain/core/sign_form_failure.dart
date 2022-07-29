import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_form_failure.freezed.dart';

@freezed
abstract class SignFormFailure<T> with _$SignFormFailure<T> {
  const factory SignFormFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory SignFormFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory SignFormFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;
  const factory SignFormFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
  const factory SignFormFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;
  const factory SignFormFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;
  const factory SignFormFailure.unExpectedFailure({
    required T failedValue,
  }) = UnExpectedFailure<T>;
}
