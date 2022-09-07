import 'package:flutter/material.dart';

import 'app_pop_button.dart';

class SignInAppBar extends StatelessWidget {
  final String title;
  const SignInAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      leading: const AppPopButton(),
      
    );
  }
}
