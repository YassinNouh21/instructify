import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/screens/course/widget/course_container.dart';
import 'package:instructify/presentation/screens/course/widget/shimmer_course.dart';
import 'package:instructify/presentation/shared/main_app_bar.dart';
import '../../../application/bloc/fetch_bloc.dart';

class CourseScreen extends StatelessWidget {
  final List<String> courseIds;
  const CourseScreen({
    Key? key,
    required this.courseIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('CourseScreen: build $courseIds');
    return BlocProvider(
      create: (context) =>
          getIt<FetchBloc>()..add(SearchByCategory(ids: courseIds)),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              MainAppBar.withSearchBar(),
              Expanded(
                child: BlocBuilder<FetchBloc, FetchState>(
                  builder: (context, state) {
                    // print('ui course view ${state.failureOrSuccess}');
                    if (state.isLoading) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        physics: const BouncingScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) => const ShimmerCourse(),
                        // CourseContainer(course: r[index] as Course),
                      );
                    } else {
                      return state.failureOrSuccess.fold(
                        () => Container(),
                        (a) => a.fold(
                          (l) => Container(),
                          (r) => ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            physics: const BouncingScrollPhysics(),
                            itemCount: r.length,
                            itemBuilder: (context, index) =>
                                CourseContainer(course: r[index] as Course),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
