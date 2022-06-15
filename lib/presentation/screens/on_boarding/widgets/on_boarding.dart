import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'E-courses free \ntrial courses',
          body: 'Free courses for you to find your\n way to learning',
          image: Center(
            child: SvgPicture.asset(AssetsManager.onBoardingImg),
          ),
          decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 16.0),
          ),
        ),
        PageViewModel(
          title: 'Quick and easy learning',
          body:
              'Easy and fast learning at any time to help you improve various skills',
          image: Center(
            child: SvgPicture.asset(AssetsManager.onBoardingImg2),
          ),
          decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 16.0),
          ),
        ),
        PageViewModel(
          title: 'Create your own study plan',
          body: 'Study according to the study plan, make study more motivated',
          image: Center(
            child: SvgPicture.asset(AssetsManager.onBoardingImg3),
          ),
          decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 16.0),
          ),
        ),
      ],

      dotsDecorator: dotDecoration(),
      showSkipButton: true,
      done: Text(
        'Done',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      next: Text(
        'Next',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      skip: Text(
        'Skip',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onDone: () {
        Navigator.of(context).pushReplacementNamed(Routes.chooseSignInMehtodRoute);
      },
    );
  }

  DotsDecorator dotDecoration() {
    return DotsDecorator(
      activeColor: ColorManager.secondaryColor,
      activeSize: const Size(SizeManager.s32, SizeManager.s8),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeManager.s8),
      ),
    );
  }
}
