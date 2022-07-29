import 'package:dartz/dartz.dart';
import 'package:form_validator/form_validator.dart';

import 'package:instructify/domain/core/sign_form_failure.dart';
import 'package:instructify/domain/core/sign_object.dart';

class EmailSignObject extends SignObject<String> {
  final Either<SignFormFailure<String>, String> value;

  EmailSignObject._(this.value);

  factory EmailSignObject.validate(String email) {
    final validatorEmail =
        ValidationBuilder().email('Unvalid email').test(email);
    switch (validatorEmail) {
      case 'The field is required':
        return EmailSignObject._(
            const Left(SignFormFailure.empty(failedValue: 'Required field')));
      case 'Unvalid email':
        return EmailSignObject._(const Left(
            SignFormFailure.invalidEmail(failedValue: 'Unvalid email')));
      default:
        return EmailSignObject._(Right(email));
    }
  }

  @override
  String toString() =>
      'EmailSignObject(value: ${value.fold((l) => l.toString(), (r) => r)})';
}
