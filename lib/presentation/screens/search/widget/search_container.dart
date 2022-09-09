import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/screens/course_detail/course_detail_view.dart';

import '../../../../model/course.dart';

class SearchContainer extends StatelessWidget {
  final Course course;
  const SearchContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.courseDetailRoute,
          arguments: course.toMap(),
        );
      },
      child: Container(
        height: 100.h,
        margin: EdgeInsets.all(15.w),
        padding: EdgeInsets.all(15.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: 70.w,
              child: Image.network(
                course.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 35.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.w,
                  child: Text(
                    course.courseName,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey, size: 15.w),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      course.instructor,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: ColorManager.shadowColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${course.price}',
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
                          '${course.duration}',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
