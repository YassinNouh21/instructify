import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// TODO: model an object that create indecator progression bar
class LearningPlanContainer extends StatelessWidget {
  final String text;
  const LearningPlanContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.start,
              )),
          SizedBox(
            height: SizeManager.s10.h,
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: 8.h, left: 20.w, right: 20.w, top: 25.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeManager.s12),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularPercentIndicator(
                      radius: 12.w,
                      lineWidth: 4.w,
                      percent: 0.8,
                      animationDuration: 600  ,
                      animation: true,
                      backgroundColor: ColorManager.secondBackgroundButtonColor,
                      progressColor: ColorManager.selectedProgressBarColor,
                    ),
                    const SizedBox(
                      width: SizeManager.s10,
                    ),
                    Expanded(
                      child: Text(
                        'Course 1',
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: [
                        Text('40',
                            style: Theme.of(context).textTheme.subtitle2),
                        Text(
                          '/24',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: ColorManager.shadowColor),
                        )
                      ],
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'more',
                      style: Theme.of(context).textTheme.subtitle2,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
