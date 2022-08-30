import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instructify/presentation/screens/course_detail/widget/banner.dart';
import 'package:instructify/presentation/screens/course_detail/widget/bottom_container.dart';
import 'package:instructify/presentation/screens/course_detail/widget/buttom_sheet_detail.dart';

import '../../shared/main_app_bar.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFffe4ec),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: [
                  const Align(
                    // bottom: 30.h,
                    alignment: Alignment.topCenter,
                    child: BannerDetail(
                        courseName:
                            'ProductProductProductasdjkfhkljasdfhjkladhsklfjhjhkdfsajkhProductProduct'),
                  ),
                  AppBar(
                    leadingWidth: 80.w,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        'assets/svg/back.svg',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 350.h),
                      child: const ButtomSheetDetail(
                        content: [],
                      )),
                ],
              ),
            ),
          ),
          BottomContainer(
            onPressedBuy: () {},
            onPressedFavorite: () {},
          )
        ]),
      ),
    );
  }
}
