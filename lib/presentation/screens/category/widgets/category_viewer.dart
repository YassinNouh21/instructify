import 'package:flutter/material.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

import '../../../shared/category_container.dart';

class CategoriesViewer extends StatelessWidget {
  final List<Category> categories;
  const CategoriesViewer({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CategoryContainer(
          category: categories[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
