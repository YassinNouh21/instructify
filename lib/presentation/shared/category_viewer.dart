import 'package:flutter/material.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/category_container.dart';

class CategoryGridViewer extends StatelessWidget {
  final List<Category> categories;
  final bool isLoading;

  const CategoryGridViewer({
    Key? key,
    required this.categories,
    this.isLoading = false,
  }) : super(key: key);
  factory CategoryGridViewer.isLoading() => const CategoryGridViewer(
        categories: [],
        isLoading: true,
      );
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? GridView.builder(
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
              mainAxisSpacing: 30,
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(SizeManager.s8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryContainer.loading();
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
              mainAxisSpacing: 30,
            ),
          );
  }
}
