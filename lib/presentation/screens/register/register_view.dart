import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/register/widgets/list_text_fields.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';
import 'package:instructify/presentation/shared/sign_in_app_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SignInAppBar(title: 'What’s Your Name?'),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            const ListTextFields(),
            const Expanded(flex: 6, child: SizedBox()),
            AppMainButton.fullWidth(
                onPressed: () {}, text: 'Next', widthQuery: width),
            const SizedBox(
              height: SizeManager.s28,
            )
          ],
        ),
      ),
    );
  }
}
