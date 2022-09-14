import 'package:flutter/material.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/presentation/screens/on_boarding/widgets/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
    PreferenceRepository.pref.setBool('isFirstTime', false);
    debugPrint(
        'boarding done ${PreferenceRepository.pref.getBool('isFirstTime')}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnBoarding(),
      ),
    );
  }
}
