import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instructify/domain/firebase/firebase_cloud.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/category_viewer.dart';
import 'package:instructify/presentation/shared/courses_viewer.dart';
import 'package:instructify/presentation/shared/main_app_bar.dart';

import '../../../infrastructure/firebase_cloud/firebase_cloud.dart';
import '../../resource/route_manager.dart';
// FIXME: Responsive design

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: FutureBuilder<List<Course>>(
            future: CloudRepository().getCourses(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  MainAppBar.withSearchBar(),
                  Expanded(flex: 3, child: categoryViewer(context, 'Yassin')),
                  Expanded(
                      flex: 4,
                      child:
                          courseViewer(context, 'Computer Science', snapshot.data!)),
                  Expanded(
                      flex: 4,
                      child: courseViewer(context, 'Mathematics', snapshot.data!)),
                ],
              );
            }),
      ),
    );
  }

  Container courseViewer(
      BuildContext context, String title, List<Course> courses) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: SizeManager.s10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: SizeManager.s10),
                child: AutoSizeText(
                  'Popular in $title',
                  maxLines: 1,
                  minFontSize: 8,
                  maxFontSize: 16,
                  wrapWords: true,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: ColorManager.secondaryColor),
                ),
              ),
              SizedBox(
                width: SizeManager.s75,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: AutoSizeText(
                    'See all',
                    maxLines: 1,
                    minFontSize: 8,
                    maxFontSize: 12,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: ColorManager.secondaryColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: CoursesViewer(
              courses: courses,
            ),
          )
        ],
      ),
    );
  }

  Container categoryViewer(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: SizeManager.s10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: SizeManager.s20),
                child: AutoSizeText(
                  'Topics',
                  maxLines: 1,
                  minFontSize: 8,
                  maxFontSize: 16,
                  wrapWords: true,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: ColorManager.secondaryColor)
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                width: SizeManager.s75,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.categoryRoute);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: AutoSizeText(
                    'See all',
                    maxLines: 1,
                    minFontSize: 8,
                    maxFontSize: 12,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: ColorManager.secondaryColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: CategoryViewer(),
          )
        ],
      ),
    );
  }
}
