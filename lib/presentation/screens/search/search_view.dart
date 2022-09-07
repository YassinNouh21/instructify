import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/application/bloc/search_bloc.dart';
import 'package:instructify/model/course.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/screens/search/widget/bottom_filter.dart';
import 'package:instructify/presentation/screens/search/widget/search_container.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../application/bloc/fetch_bloc.dart';
import '../../../injection.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FetchBloc>(),
      child: Scaffold(
        body: Center(
          child: FloatingSearchBar(
            hint: 'Find Course',
            borderRadius: BorderRadius.circular(12.r),
            height: 50.h,
            scrollPadding: EdgeInsets.only(top: 0.h, bottom: 56),
            leadingActions: [
              FloatingSearchBarAction.icon(
                  icon: SvgPicture.asset(AssetsManager.searchIcon),
                  onTap: () {})
            ],
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            // openAxisAlignment: 100,
            // clearQueryOnClose: true,
            automaticallyImplyBackButton: false,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              // print('search bar $query');
              if (query.isNotEmpty) {
                context.read<SearchBloc>().add(SearchEvent.searched(query));
              }
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: SlideFadeFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                builder: (context, animation) {
                  final canPop = Navigator.canPop(context);
                  return CircularButton(
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                    size: 25.w,
                    icon: SvgPicture.asset(AssetsManager.closeIcon,
                        color: ColorManager.shadowColor),
                    onPressed: () {
                      final bar = FloatingSearchAppBar.of(context)!;

                      if (bar.isOpen && !bar.isAlwaysOpened) {
                        bar.close();
                      } else if (canPop) {
                        Navigator.pop(context);
                      }
                    },
                  );
                },
                showIfOpened: true,
              ),
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  size: 15.w,
                  icon: SvgPicture.asset(
                    AssetsManager.filterIcon,
                    width: 15.w,
                    fit: BoxFit.fitWidth,
                  ),
                  onPressed: () {
                    // BottomSheetApp().mainBottomSheet(context);
                  },
                ),
              ),
            ],
            body: Container(color: Colors.white),

            builder: (context, transition) {
              return BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state.searchedCourses.fold(
                      () => Container(),
                      (a) => a.fold((l) => Container(), (r) {
                            return ListView.builder(
                              itemCount: r.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                print(r.length);
                                return SearchContainer(
                                  course: r[index],
                                );
                              },
                            );
                          }));
                },
              );
            },
          ),
        ),
      ),
    );
    // const SecondaryAppBar(title: 'Search'),
  }
}
// class SearchBar extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     print('u i search bar onQueryChanged $query');

//     context.read<SearchBloc>().add(SearchEvent.searched(query));

//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, query);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     context.read<SearchBloc>().add(SearchEvent.searched(query));
//     return Container(
//       child: Text(''),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(
//       child: Text(''),
//     );
//   }
// }
