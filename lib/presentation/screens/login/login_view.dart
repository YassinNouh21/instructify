import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/login/widgets/list_text_fields.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';
import 'package:instructify/presentation/shared/sign_in_app_bar.dart';

import 'widgets/forgot_password_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SignInAppBar(title: 'Login'),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: SizeManager.s16,
            ),
            ListTextFields(),
            const Expanded(flex: 6, child: SizedBox()),
            const ForgotPasswordButton(),
            const Expanded(flex: 2, child: SizedBox()),
            AppMainButton.fullWidth(
                onPressed: () {}, text: 'Login', widthQuery: width),
            const SizedBox(height: SizeManager.s28)
          ],
        ),
      ),
    );
  }
}
