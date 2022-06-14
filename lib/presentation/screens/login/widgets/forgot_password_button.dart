import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Navigator.pushNamed(context, Routes.loginRoute),
      child: const Text(
        'Forgot Password',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
