import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CoursePlanContainer extends StatelessWidget {
  final String topicName;
  final String courseName;

  const CoursePlanContainer({
    Key? key,
    required this.courseName,
    required this.topicName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topicName,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeManager.s10.h,
          ),
          Container(
            padding: EdgeInsets.only(
              left: SizeManager.s25.w,
              right: SizeManager.s25.w,
              top: SizeManager.s25.h,
              bottom: SizeManager.s10.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(SizeManager.s12),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    courseName,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '46min  ',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      '/ 60min',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: ColorManager.textUnselectedColor),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    Container(
                      alignment: Alignment.center,
                      height: 15.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: ColorManager.backgroundButtonColor,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      // TODO: Add number of hours of the course
                      child: Text(
                        '15 hours',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 10.sp,
                              color: ColorManager.fontColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 5.h,
                  percent: 0.6,
                  linearStrokeCap: LinearStrokeCap.butt,
                  linearGradient: LinearGradientManager.courseSlider,
                  backgroundColor: ColorManager.secondBackgroundButtonColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
