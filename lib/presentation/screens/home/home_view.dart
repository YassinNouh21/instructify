import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/category_viewer.dart';
import 'package:instructify/presentation/shared/courses_viewer.dart';
import 'package:instructify/presentation/shared/main_app_bar.dart';
import 'package:instructify/model/category.dart' as model;

import '../../../application/bloc/fetch_bloc.dart';
import '../../resource/route_manager.dart';
// FIXME: Responsive design

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FetchBloc bloc1 = getIt<FetchBloc>()
    ..add(FetchCategory(dataType: DataType.Category));
  final FetchBloc bloc2 = getIt<FetchBloc>()
    ..add(FetchCourse(dataType: DataType.Course));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<FetchBloc>(
      create: (context) => getIt<FetchBloc>(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.primaryColor,
          body: Column(
            children: [
              MainAppBar.withSearchBar(),
              BlocBuilder<FetchBloc, FetchState>(
                bloc: bloc1,
                builder: (context, state) {
                  // print('ui state: ${state.dataType} ${state}');
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // print('state ui: ${state.dataType}');
                    if (state.dataType == DataType.Category) {
                      return state.failureOrSuccess.fold(
                        () => Container(),
                        (a) => a.fold(
                            (l) => Container(
                                  height: 100.h,
                                  width: 100.w,
                                  child: Text('Error has occur'),
                                ), (r) {
                          // print('ui categoty $r');
                          return Expanded(
                            flex: 3,
                            child: categoryViewer(
                              context,
                              r as List<model.Category>,
                            ),
                          );
                        }),
                      );
                    }
                  }
                  return Container();
                },
              ),
              BlocBuilder<FetchBloc, FetchState>(
                bloc: bloc2,
                builder: (context, state) {
                  // print('ui state: ${state.dataType} ${state}');
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // print('state ui: ${state.dataType}');
                    if (state.dataType == DataType.Course) {
                      return state.failureOrSuccess.fold(
                        () => Container(),
                        (a) => a.fold(
                            (l) => Container(
                                  height: 100.h,
                                  width: 100.w,
                                  child: Text('Error has occur'),
                                ), (r) {
                          // print('ui categoty $r');
                          return Expanded(
                            flex: 4,
                            child: courseViewer(
                              context,
                              'Math',
                              r as List<Course>,
                            ),
                          );
                        }),
                      );
                    }
                  }
                  return Container();
                },
              ),
              BlocBuilder<FetchBloc, FetchState>(
                bloc: bloc2,
                builder: (context, state) {
                  // print('ui state: ${state.dataType} ${state}');
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    print('state ui: ${state.dataType}');
                    if (state.dataType == DataType.Course) {
                      return state.failureOrSuccess.fold(
                        () => Container(),
                        (a) => a.fold(
                            (l) => Container(
                                  height: 100.h,
                                  width: 100.w,
                                  child: Text('Error has occur'),
                                ), (r) {
                          // print('ui categoty $r');
                          return Expanded(
                            flex: 4,
                            child: courseViewer(
                              context,
                              'Math',
                              r as List<Course>,
                            ),
                          );
                        }),
                      );
                    }
                  }
                  return Container();
                },
              ),
              // BlocBuilder<FetchBloc, FetchState>(
              //   bloc: bloc2,
              //   builder: (context, state) {
              //     print(state.dataType);
              //   },
              // ),
              // Expanded(
              //   flex: 4,
              //   child: courseViewer(
              //     context,
              //     'Mathematics',
              //     r as List<Course>,
              //   ),
              // ),
            ],
          ),
        ),
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
          // SizedBox(height: 8.h),
          Expanded(
            child: CoursesViewer(
              courses: courses,
            ),
          )
        ],
      ),
    );
  }

  Container categoryViewer(
      BuildContext context, List<model.Category> categories) {
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
          Expanded(
            child: CategoryViewer(categories: categories),
          )
        ],
      ),
    );
  }
}
