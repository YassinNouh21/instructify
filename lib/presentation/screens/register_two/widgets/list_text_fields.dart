import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

import '../../../../application/validation/validation_bloc.dart';

class ListTextFields extends StatefulWidget {
  static String email = '';
  static String rePassword = '';
  static String password = '';
  static final formKey = GlobalKey<FormState>();
  const ListTextFields({Key? key}) : super(key: key);

  @override
  State<ListTextFields> createState() => ListTextFieldsState();
}

class ListTextFieldsState extends State<ListTextFields> {
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return BlocConsumer<ValidationBloc, ValidationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: ListTextFields.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleTextField(
                controller: _emailController,
                label: 'Email',
                validator: ValidationBuilder().email().required().build(),
                onChanged: (value) {
                  _emailController.text = value;
                  ListTextFields.email = value;
                  _emailController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _emailController.text.length));
                },
                showPassword: false,
              ),
              const SizedBox(height: SizeManager.s28),
              SizedBox(
                width: width,
                child: Text(
                  'Must be at Least 6 Characters in Length',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: SizeManager.s28),
              SingleTextField(
                controller: _passwordController,
                label: 'Password',
                validator: ValidationBuilder().minLength(6).required().build(),
                onChanged: (value) {
                  ListTextFields.password = value;

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
                  ListTextFields.rePassword = value;
                  _repeatedPasswordController.text = value;
                  _repeatedPasswordController.selection =
                      TextSelection.fromPosition(TextPosition(
                          offset: _repeatedPasswordController.text.length));
                },
                validator: (value) {
                  if (value != ListTextFields.password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                showPassword: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
