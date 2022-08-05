import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

class ListTextFields extends StatelessWidget {
  static String email = '';
  static String password = '';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  ListTextFields({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleTextField(
            controller: _emailController,
            label: 'Email',
            validator: ValidationBuilder().required().email().build(),
            onChanged: (value) {
              _emailController.text = value;
              _emailController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _emailController.text.length));
              email = _emailController.text;
            },
            showPassword: false,
          ),
          const SizedBox(
            height: SizeManager.s28,
          ),
          SingleTextField(
            controller: _passwordController,
            label: 'Password',
            validator: ValidationBuilder().required().minLength(6).build(),
            onChanged: (value) {
              _passwordController.text = value;
              _passwordController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _passwordController.text.length));
              password = _passwordController.text;
            },
            showPassword: true,
          )
        ],
      ),
    );
  }
}
