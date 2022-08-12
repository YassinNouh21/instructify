import 'package:freezed_annotation/freezed_annotation.dart';
part 'cloud_failure.freezed.dart';
@freezed
abstract class CloudFailure {
  const factory CloudFailure.objectServerError() = ObjectServerError;
  const factory CloudFailure.unauthorized() = Unauthorized;
  const factory CloudFailure.objectNotFound() = ObjectNotFound;
  const factory CloudFailure.unkown() = Unknown;
}
