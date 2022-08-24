import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/model/category.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/category/widgets/category_viewer.dart';
import 'package:instructify/presentation/shared/secondary_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/model/category.dart' as model;
import '../../../application/bloc/fetch_bloc.dart';

class CategoryView extends StatelessWidget {
  CategoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FetchBloc>()..add(FetchCategory(dataType: DataType.Category)),
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: SecondaryAppBar(title: 'HI'),
              ),
              Expanded(
                  flex: 12,
                  child: BlocBuilder<FetchBloc, FetchState>(
                      builder: (context, state) {
                    print('ui category view ${state.failureOrSuccess}');
                    return state.failureOrSuccess.fold(
                        () => Container(),
                        (either) => either.fold(
                              (failure) => const Center(
                                child: Text('Error'),
                              ),
                              (success) => CategoriesViewer(
                                categories: success as List<model.Category>,
                              ),
                            ));
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
