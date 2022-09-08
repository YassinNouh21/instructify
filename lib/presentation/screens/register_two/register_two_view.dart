import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/register/widgets/list_text_fields.dart'
    as RegisterListTexts;
import 'package:instructify/presentation/screens/register_two/widgets/list_text_fields.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';
import 'package:instructify/presentation/shared/dialog.dart';
import 'package:instructify/presentation/shared/sign_in_app_bar.dart';

import '../../../application/auth/authentication_bloc.dart';

class RegisterTwoView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(debugLabel: 'GlobalFormKey #SignIn ');
  final _formCopy = ListTextFields.formKey1;
  RegisterTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.map((a) => a.fold(
              (f) async {
                await showMyDialog(context, f.errorMessage);
              },
              (_) {},
            ));
        if (state.state == AuthenticationStates.authenticated) {
          Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SignInAppBar(title: 'Your Password'),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                height: 650.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: SizeManager.s16,
                    ),
                    const ListTextFields(),
                    SizedBox(
                      height: 40.h,
                    ),
                    AppMainButton.fullWidth(
                      onPressed: () {
                        if (_formCopy.currentState!.validate() &&
                            ListTextFields.password ==
                                ListTextFields.rePassword) {
                          context.read<AuthenticationBloc>().add(
                                AuthenticationRegister(
                                  email: ListTextFields.email,
                                  password: ListTextFields.password,
                                  firstName: RegisterListTexts
                                      .ListTextFields.firstName,
                                  lastName:
                                      RegisterListTexts.ListTextFields.lastName,
                                ),
                              );
                        }
                      },
                      text: 'Create Account',
                      widthQuery: width,
                    ),
                    const SizedBox(
                      height: SizeManager.s28,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
