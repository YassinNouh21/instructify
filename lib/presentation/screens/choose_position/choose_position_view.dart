import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/choose_position/widgets/radio_buttons.dart';
import 'package:instructify/presentation/shared/app_main_button.dart';

import '../../shared/sign_in_app_bar.dart';

// FIXME app bar top margin
class ChoosePositionView extends StatelessWidget {
  const ChoosePositionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SignInAppBar(title: 'What’s Your Position?'),
      ),
      body: Column(
        children: [
          const AppRadioButtons(),
          Expanded(child: Container()),
          AppMainButton.fullWidth(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.registerRoute);
              },
              text: 'Next',
              widthQuery: width),
          const SizedBox(
            height: SizeManager.s28,
          ),
        ],
      ),
    );
  }
}
