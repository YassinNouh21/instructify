import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

import '../../../../application/validation/validation_bloc.dart';

class ListTextFields extends StatefulWidget {
  const ListTextFields({Key? key}) : super(key: key);

  @override
  State<ListTextFields> createState() => ListTextFieldsState();
}

class ListTextFieldsState extends State<ListTextFields> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidationBloc, ValidationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleTextField(
                controller: _passwordController,
                label: 'Password',
                validator: ValidationBuilder().minLength(6).required().build(),
                onChanged: (value) {
                  _passwordController.text = value;
                  _passwordController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _passwordController.text.length));
                },
                showPassword: true,
              ),
              const SizedBox(height: SizeManager.s28),
              SingleTextField(
                controller: _repeatedPasswordController,
                label: 'Repeat Password',
                onChanged: (value) {
                  _repeatedPasswordController.text = value;
                  _repeatedPasswordController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: _repeatedPasswordController.text.length));
                },
                validator: ValidationBuilder().minLength(6).required().build(),
                showPassword: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
