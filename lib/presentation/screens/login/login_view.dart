import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/login/widgets/list_text_fields.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';
import 'package:instructify/presentation/shared/dialog.dart';
import 'package:instructify/presentation/shared/sign_in_app_bar.dart';

import 'widgets/forgot_password_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.map((a) => a.fold(
                (f) async {
                  await showMyDialog(context, f.errorMessage);
                },
                (_) {
                  Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
                },
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
      ),
    );
  }
}
