import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/register_two/widgets/list_text_fields.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';
import 'package:instructify/presentation/shared/sign_in_app_bar.dart';

class RegisterTwoView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SignInAppBar(title: 'Your Password'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
              SizedBox(
                width: width,
                child: Text(
                  'Must be at Least 6 Characters in Length',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: SizeManager.s16,
              ),
              const ListTextFields(),
              const Expanded(flex: 6, child: SizedBox()),
              AppMainButton.fullWidth(
                onPressed: () {
                  print('Form is not valid');
                  
                  if (_formKey.currentState!.validate()) {
                    print('Form is valid');
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
    );
  }
}
