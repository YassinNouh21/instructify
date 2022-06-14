import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Center(
          child: Text('Register Screen'),
        ),
      ),
    );
  }
}