import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/injection.dart';
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
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.map((a) => a.fold(
              (f) async {
                await _showMyDialog(context, f.errorMessage);
              },
              (_) {},
            ));
      },
      child: SafeArea(
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
                  onPressed: () {
                    if (ListTextFields.formKey.currentState!.validate()) {
                      context.read<AuthenticationBloc>().add(
                            AuthenticationSignIn(
                              email: ListTextFields.email,
                              password: ListTextFields.password,
                            ),
                          );
                    }
                  },
                  text: 'Login',
                  widthQuery: width),
              const SizedBox(height: SizeManager.s28)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String error) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error),
                const Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
