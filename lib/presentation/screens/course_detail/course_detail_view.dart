
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/injection.dart';

import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/screens/course_detail/widget/banner.dart';
import 'package:instructify/presentation/screens/course_detail/widget/bottom_container.dart';
import 'package:instructify/presentation/screens/course_detail/widget/buttom_sheet_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CourseDetailView extends StatelessWidget {
  const CourseDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final course =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return BlocProvider(
      create: (context) => getIt<AuthenticationBloc>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFffe4ec),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Align(
                        // bottom: 30.h,
                        alignment: Alignment.topCenter,
                        child: BannerDetail(
                            courseName:
                                Course.fromMap(course).courseName.toString()),
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
                          child: ButtomSheetDetail(
                            course: Course.fromMap(course),
                          )),
                    ],
                  ),
                ),
              ),
              BottomContainer(
                isFavorite: true,
                onPressedBuy: () {},
                onPressedFavorite: () {
                  // print(Course.fromMap(course).courseId.toString()));
                  String courseId = Course.fromMap(course).courseId.toString();
                  context
                      .read<AuthenticationBloc>()
                      .add((AuthenticationFavoriteCourse(courseId: courseId)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
