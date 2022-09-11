import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:sizer/sizer.dart';

import '../../application/auth/authentication_bloc.dart';

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
      height: 15.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          SizedBox(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back, ${context.watch<AuthenticationBloc>().localUser.fullName.split(' ')[0] ?? ''}',
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.accountRoute,
                  ),
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
                    // showSearch(context: context, delegate: SearchBar());
                    Navigator.pushNamed(context, Routes.searchRoute);
                  },
                  child: Container(
                    height: 5.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F3FD),
                      borderRadius: BorderRadius.circular(SizeManager.s10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        SvgPicture.asset(
                          AssetsManager.searchIcon,
                          color: const Color(0xFFB8B8D2),
                          width: 5.w,
                        ),
                        const SizedBox(
                          width: SizeManager.s14,
                        ),
                        Text(
                          'Find Course',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: const Color(0xFFB8B8D2),
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
