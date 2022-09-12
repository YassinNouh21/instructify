import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/application/bloc/favorite_bloc.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/presentation/shared/main_app_bar.dart';
import 'package:instructify/presentation/screens/course/widget/course_container.dart';

import '../../../../application/bloc/fetch_bloc.dart';
import '../../../../model/course.dart';
import '../../course/widget/shimmer_course.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MainAppBar(searchBar: false),
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
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
                        (l) {
                          debugPrint('ui course view failure $l');
                          return Container();
                        },
                        (r) {
                          if (r.isEmpty) {
                            return const Center(
                              child: Text('No favorite courses'),
                            );
                          } else {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 24.h),
                              physics: const BouncingScrollPhysics(),
                              itemCount: r.length,
                              itemBuilder: (context, index) =>
                                  CourseContainer(course: r[index] as Course),
                            );
                          }
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
