import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/account/account_view.dart';
import 'package:instructify/presentation/screens/courses/courses_view.dart';
import 'package:instructify/presentation/screens/download/download_view.dart';
import 'package:instructify/presentation/screens/home/home_view.dart';
import 'package:instructify/presentation/shared/app_nav_bar.dart';

import '../../shared/main_app_bar.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> screens = const [
    HomeView(),
    CoursesView(),
    DownloadView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBottomNavBar(),
      body: screens[_currentIndex],
    );
  }

  BottomNavigationBar appBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.white,
      onTap: (selectedIndex) => setState(() => _currentIndex = selectedIndex),
      selectedItemColor: ColorManager.secondaryColor,
      unselectedItemColor: ColorManager.textUnselectedColor,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsManager.homeIcon,
            color: ColorManager.secondBackgroundButtonColor,
          ),
          activeIcon: SvgPicture.asset(
            AssetsManager.homeIcon,
            color: ColorManager.secondaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsManager.bookmarkIcon,
            color: ColorManager.secondBackgroundButtonColor,
          ),
          activeIcon: SvgPicture.asset(AssetsManager.bookmarkIcon,
              color: ColorManager.secondaryColor),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsManager.downloadIcon,
            color: ColorManager.secondBackgroundButtonColor,
          ),
          activeIcon: SvgPicture.asset(AssetsManager.downloadIcon,
              color: ColorManager.secondaryColor),
          label: 'Download',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsManager.profileIcon,
          ),
          activeIcon: SvgPicture.asset(AssetsManager.profileIcon,
              color: ColorManager.secondaryColor),
          label: 'Account',
        ),
      ],
    );
  }
}
