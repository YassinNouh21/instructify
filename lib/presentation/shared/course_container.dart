import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadowColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.courseDetailRoute,
            arguments: course.toMap()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 125.w,
                height: 90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(course.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              ' ${course.courseName}',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  color: ColorManager.textUnselectedColor,
                  size: 20.r,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  course.instructor,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.textUnselectedColor,
                  ),
                  overflow: TextOverflow.clip,
                  
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$ ${course.price}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.secondaryColor,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 15.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: ColorManager.backgroundButtonColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Text(
                      '${course.convertMinutesToHours(course.duration)} hours',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorManager.fontColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
