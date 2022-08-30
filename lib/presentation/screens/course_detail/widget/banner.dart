import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerDetail extends StatelessWidget {
  final String courseName;
  const BannerDetail({
    Key? key,
    required this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350.h,
          color: Colors.blueGrey,
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
            'assets/svg/bg.svg',
            width: double.infinity,
            fit: BoxFit.cover,
            // color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 150.h, left: 30.w, right: 90.w),
          child: Container(
            width: 140.w,
            child: Text(
              courseName,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: TextStyle(color: Colors.black, fontSize: 30.sp),
            ),
          ),
          // top: 150.h,
          // left: 40.w,
        ),
      ],
    );
  }
}
