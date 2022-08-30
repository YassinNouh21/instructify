import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/course_detail/widget/course_list_tile_detail.dart';

class ButtomSheetDetail extends StatelessWidget {
  final List<Content> content;
  const ButtomSheetDetail({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        top: 40.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Course Detail',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '\$ See All',
                style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          ListView.builder(itemBuilder: (context, index) {
            return CourseListTile(
              index: index.toString(),
              courseName: content[index].topic,
              duration: content[index].duration,
            );
          }),
        ],
      ),
    );
  }
}
