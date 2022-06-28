import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

import 'course_container.dart';

class CoursesViewer extends StatelessWidget {
  const CoursesViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.only(
        left: SizeManager.s10,
        bottom: SizeManager.s10,
        top: SizeManager.s10,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return  CourseContainer();
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.1,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}
