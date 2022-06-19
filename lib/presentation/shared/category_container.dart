import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadowColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 45.h,
            width: 45.w,
            child: Image.network(
              'https://dummyimage.com/125x100/000/fff',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(
            // TODO: Add name in Category
            'Topics',
            maxLines: 1,
            style: Theme.of(context).textTheme.subtitle2!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
