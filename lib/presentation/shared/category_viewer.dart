import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/category_container.dart';

class CategoryViewer extends StatelessWidget {
  const CategoryViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(SizeManager.s8),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const CategoryContainer();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
      ),
    );
  }
}
