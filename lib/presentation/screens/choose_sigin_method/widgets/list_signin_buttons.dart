import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';

class ListOfSigInButtons extends StatelessWidget {
  const ListOfSigInButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppMainButton(
          onPressed: () {},
          text: 'Sign In with Facebook',
          icon: Icons.facebook,
        ),
        const SizedBox(height: SizeManager.s12),
        AppMainButton(
          onPressed: () {},
          text: 'Sign In with Google',
          icon: FontAwesomeIcons.google,
        ),
        const SizedBox(height: SizeManager.s12),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.choosePositionRoute);
          },
          child: const Text('Create an Account'),
        ),
      ],
    );
  }
}
