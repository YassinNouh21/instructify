import 'package:flutter/material.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/category_container.dart';

class CategoryViewer extends StatelessWidget {
  final List<Category> categories;
  const CategoryViewer({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(SizeManager.s8),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryContainer(
          category: categories[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
      ),
    );
  }
}
