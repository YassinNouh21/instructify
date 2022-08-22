import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/category/widgets/category_viewer.dart';
import 'package:instructify/presentation/shared/secondary_app_bar.dart';

class CategoryView extends StatelessWidget {
  List<Category> categories;
  CategoryView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SecondaryAppBar(title: 'HI'),
            ),
            Expanded(
                flex: 12,
                child: CategoriesViewer(
                  categories: categories,
                )),
          ],
        ),
      ),
    );
  }
}
