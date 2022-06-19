import 'package:flutter/material.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleTextField(
      label: 'Email',
      controller: _emailTextController,
      showPassword: false,
    );
  }
}
