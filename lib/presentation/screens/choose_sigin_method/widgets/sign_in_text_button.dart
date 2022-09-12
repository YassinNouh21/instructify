import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

class SignInTextButton extends StatelessWidget {
  const SignInTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.loginRoute);
      },
      child: const Text(
        'Sign In',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
