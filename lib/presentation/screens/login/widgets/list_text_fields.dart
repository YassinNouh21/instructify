import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

class ListTextFields extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  ListTextFields({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleTextField(
            controller: _emailController,
            label: 'Email',
            showPassword: false,
          ),
          const SizedBox(
            height: SizeManager.s28,
          ),
          SingleTextField(
            controller: _passwordController,
            label: 'Password',
            showPassword: true,
          )
        ],
      ),
    );
  }
}
