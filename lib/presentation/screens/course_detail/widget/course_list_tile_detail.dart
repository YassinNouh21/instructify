import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class CourseListTile extends StatelessWidget {
  final String index;
  final String courseName;
  final String duration;
  const CourseListTile({
    Key? key,
    required this.index,
    required this.courseName,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      height: 60.h,
      width: 370.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              int.parse(index) < 10 ? '0$index' : index,
              style: TextStyle(
                color: const Color(0xFFB8B8D2),
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 30.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.h,
                ),
                width: 250.w,
                child: Text(
                  courseName,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text(
                duration,
                style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            iconSize: 30.w,
            icon: SvgPicture.asset(
              AssetsManager.playIcon,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
