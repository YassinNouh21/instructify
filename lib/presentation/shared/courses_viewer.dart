import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

import 'course_container.dart';

class CoursesViewer extends StatelessWidget {
  final List<Course> courses;
  final bool isLoading;

  const CoursesViewer({
    Key? key,
    required this.courses,
    this.isLoading = false,
  }) : super(key: key);
  factory CoursesViewer.loading() {
    return const CoursesViewer(
      isLoading: true,
      courses: [],
    );
  }
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            padding: EdgeInsets.only(
              left: SizeManager.s10.w,
              bottom: 5.h,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ShimmerCourseContainer();
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.9,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 10.0.h,
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 6,
            padding: EdgeInsets.only(
              left: SizeManager.s10.w,
              bottom: 5.h,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CourseContainer(
                course: courses[index],
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.9,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 10.0.h,
            ),
          );
  }
}
