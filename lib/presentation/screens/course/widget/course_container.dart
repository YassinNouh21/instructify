import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      width: 350.w,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 12,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70.r,
            width: 70.r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage(course.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 35.w,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  course.courseName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 16.r,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      course.instructor,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
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
        ],
      ),
    );
  }
}
