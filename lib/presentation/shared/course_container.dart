import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        onTap: () => Navigator.pushNamed(context, Routes.courseDetailRoute),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Add name in course photo
            Expanded(
              flex: 3,
              child: Image.network(
                'https://dummyimage.com/125x100/000/fff',
                height: 100.h,
                width: 100.w,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO: Add name in course name
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ahmed',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: ColorManager.textUnselectedColor,
                    size: 20.r,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  // TODO: Add name of the instructor
                  Text(
                    'Instructor',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: ColorManager.textUnselectedColor,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // TODO: Add price of the course
                  Text(
                    '\$ 190',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
