import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/search/widget/bottom_filter.dart';
import 'package:instructify/presentation/screens/search/widget/search_container.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchView extends StatelessWidget {
  final Random random = Random();
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FloatingSearchBar(
        hint: 'Find Course',
        borderRadius: BorderRadius.circular(12.r),
        height: 50.h,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        leadingActions: [
          FloatingSearchBarAction.icon(
              icon: SvgPicture.asset(AssetsManager.searchIcon), onTap: () {})
        ],
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        openAxisAlignment: 0.0,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: SlideFadeFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            builder: (context, animation) {
              final canPop = Navigator.canPop(context);
              return CircularButton(
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                size: 25.w,
                icon: SvgPicture.asset(AssetsManager.closeIcon,
                    color: ColorManager.shadowColor),
                onPressed: () {
                  final bar = FloatingSearchAppBar.of(context)!;

                  if (bar.isOpen && !bar.isAlwaysOpened) {
                    bar.close();
                  } else if (canPop) {
                    Navigator.pop(context);
                  }
                },
              );
            },
            showIfOpened: true,
          ),
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              size: 15.w,
              icon: SvgPicture.asset(
                AssetsManager.filterIcon,
                width: 15.w,
                fit: BoxFit.fitWidth,
              ),
              onPressed: () {
                BottomSheetApp().mainBottomSheet(context);
              },
            ),
          ),
        ],
        body: Container(
          color: Colors.pink,
        ),

        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(12,
                          (index) => SearchContainer(title: index.toString()))
                      .toList()),
            ),
          );
        },
      ),
    ));
    // const SecondaryAppBar(title: 'Search'),
  }
}
