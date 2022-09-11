import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/injection.dart';

import 'package:instructify/model/course.dart';
import 'package:instructify/model/user.dart';
import 'package:instructify/presentation/screens/course_detail/widget/banner.dart';
import 'package:instructify/presentation/screens/course_detail/widget/bottom_container.dart';
import 'package:instructify/presentation/screens/course_detail/widget/buttom_sheet_detail.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final course =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    debugPrint('CourseDetailView build $course');
    return SafeArea(
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
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return BottomContainer(
                  isFavorite: BlocProvider.of<AuthenticationBloc>(context,
                          listen: false)
                      .localUser
                      .favoriteCourses
                      ?.contains(Course.fromMap(course).courseId),
                  onPressedBuy: () {},
                  onPressedFavorite: () {
                    // print(Course.fromMap(course).courseId.toString()));
                    String courseId =
                        Course.fromMap(course).courseId.toString();
                    context.read<AuthenticationBloc>().add(
                        (AuthenticationFavoriteCourse(courseId: courseId)));
                    debugPrint(
                        'tempp = ${BlocProvider.of<AuthenticationBloc>(context, listen: false).localUser.favoriteCourses?.contains(Course.fromMap(course).courseId)}');
                    debugPrint(
                        'temp couse = ${Course.fromMap(course).courseId}');
                    debugPrint(
                        'temp coursess= ${BlocProvider.of<AuthenticationBloc>(context, listen: false).localUser.favoriteCourses}');
                    debugPrint(
                        'temp local= ${User.fromMap(jsonDecode(PreferenceRepository.pref.getString('user')!))}');
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
