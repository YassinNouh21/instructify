import 'package:flutter/material.dart';
import 'package:instructify/model/course.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/presentation/resource/size_manager.dart';

import 'course_container.dart';

class CoursesViewer extends StatelessWidget {
  final List<Course> courses;
  const CoursesViewer({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
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
