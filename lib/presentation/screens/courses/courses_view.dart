import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/courses/widgets/course_plan_container.dart';
import 'package:instructify/presentation/screens/courses/widgets/learning_plan_container.dart';
import 'package:instructify/presentation/shared/main_app_bar.dart';

//TODO: change app bar visible with scroll
class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: Size(double.infinity, 115.h),
              child: const MainAppBar(searchBar: false),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  LearningPlanContainer(
                    text: 'Learning Plan',
                  ),
                  CoursePlanContainer(
                    courseName: 'Java Development',
                    topicName: 'Computer Science',
                  ),
                  CoursePlanContainer(
                    courseName: 'Java Development',
                    topicName: 'Computer Science',
                  ),
                  CoursePlanContainer(
                    courseName: 'Java Development',
                    topicName: 'Computer Science',
                  ),
                  CoursePlanContainer(
                    courseName: 'Java Development',
                    topicName: 'Computer Science',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
