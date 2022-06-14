import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/choose_sigin_method/widgets/list_signin_buttons.dart';
import 'package:instructify/presentation/screens/choose_sigin_method/widgets/sign_in_text_button.dart';
import 'package:instructify/presentation/screens/choose_sigin_method/widgets/terms_text.dart';

import '../../shared/app_main_button.dart';
import 'widgets/image_displayer.dart';
import 'widgets/text_under_image.dart';

class ChooseSignInMethodView extends StatelessWidget {
  const ChooseSignInMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
          Expanded(flex: 4, child: SizedBox()),
          ImageDisplayer(),
          SizedBox(height: SizeManager.s32),
          TextUnderImage(),
          SizedBox(height: SizeManager.s20),
          ListOfSigInButtons(),
          Expanded(flex: 1, child: SizedBox()),
          SignInTextButton(),
          Expanded(flex: 2, child: SizedBox()),
          TermsText(),
          Expanded(flex: 3, child: SizedBox()),
              ],
            ),
        ));
  }
}
