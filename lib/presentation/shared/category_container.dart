import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class CategoryContainer extends StatelessWidget {
  Category category;
  CategoryContainer({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                category.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            // TODO: Add name in Category
              category.name,
            maxLines: 1,
            style: Theme.of(context).textTheme.caption!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
