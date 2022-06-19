import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

// FIXME: the padding between the icon and the label
class AppNavBar extends StatefulWidget {
  const AppNavBar({Key? key}) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return app_bottom_nav_bar();
  }

  BottomNavigationBar app_bottom_nav_bar() {
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
