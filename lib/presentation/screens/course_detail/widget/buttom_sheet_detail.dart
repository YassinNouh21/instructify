import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/course_detail/widget/course_list_tile_detail.dart';

class ButtomSheetDetail extends StatelessWidget {
  final Course course;
  const ButtomSheetDetail({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double remainingHeight = MediaQuery.of(context).size.height -
        (course.content.length * 95.h) -
        20.h -
        100.h -
        20.h -
        350.h;
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
              const Spacer(),
              Text(
                '\$ ${course.price}',
                style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: course.content.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CourseListTile(
                  index: index.toString(),
                  courseName: course.content[index].topic,
                  duration: course.content[index].duration,
                );
              }),
          Container(
            width: double.infinity,
            color: Colors.white,
            height: remainingHeight < 0 ? 0 : remainingHeight,
          ),
          // Spacer(),
          // Column(
          //   children: [
          //     CourseListTile(
          //       index: content[0].,
          //       courseName: content[0].topic,
          //       duration: content[0].duration,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
