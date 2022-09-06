import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/screens/search/search_view.dart';
import 'package:sizer/sizer.dart';

class MainAppBar extends StatelessWidget {
  final bool searchBar;
  const MainAppBar({Key? key, required this.searchBar}) : super(key: key);
  factory MainAppBar.withSearchBar({searchBar = true}) {
    return MainAppBar(
      searchBar: searchBar = true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.secondaryColor,
      width: double.infinity,
      height: 18.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: Add name in User
                    Text(
                      'Welcome Back, Ahmed',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Let’s start learning',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                // TODO: Add ontap to profile the route
                GestureDetector(
                  // onTap: () => Navigator.pushNamed(context, Routes.profile),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: SizeManager.s40,
                      minWidth: SizeManager.s25,
                    ),
                    child: SvgPicture.asset(
                      AssetsManager.avatarIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          searchBar
              ? InkWell(
                  onTap: () {
                    showSearch(context: context, delegate: SearchBar());
                  },
                  child: Container(
                    height: SizeManager.s50,
                    width: 85.w,
                    color: ColorManager.primaryColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
