import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class SearchContainer extends StatelessWidget {
  final String title;
   SearchContainer({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.w),
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
              'https://dummyimage.com/100x100/000/fff',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 35.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prodct Manging course $title',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Row(
                children: [
                  Icon(Icons.person, color: Colors.grey, size: 8.w),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Prodct Manging course',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: ColorManager.shadowColor),
                  ),
                ],
              ),
              Row(
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
            ],
          )
        ],
      ),
    );
  }
}
