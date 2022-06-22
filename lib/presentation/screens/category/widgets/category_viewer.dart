import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

import '../../../shared/category_container.dart';

class CategoriesViewer extends StatelessWidget {
  const CategoriesViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return const CategoryContainer();
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
