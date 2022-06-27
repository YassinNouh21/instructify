import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

class BottomSheetApp {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        //isScrollControlled: true,     //bottomsheet goes full screen, if bottomsheet has a scrollable widget such as a listview as a child.
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 35.h),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.filterClosedIcon,
                          color: Colors.black,
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            'Search Filter',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: 10.h,
                            width: double.infinity,
                          ),
                          const BottomChoiceChip(),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Price'),
                          SizedBox(
                            height: 10.h,
                            width: double.infinity,
                          ),
                          BottomSlider(),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}

class BottomSlider extends StatefulWidget {
  const BottomSlider({Key? key}) : super(key: key);

  @override
  State<BottomSlider> createState() => _BottomSliderState();
}

class _BottomSliderState extends State<BottomSlider> {
  final double _min = 1000;
  final double _max = 5000;
  RangeValues _currentSliderValue = const RangeValues(1000, 2000);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentSliderValue,
      max: _max,
      activeColor: ColorManager.secondaryColor,
      inactiveColor: ColorManager.shadowColor,
      min: _min,
      
      onChanged: (range) {
        setState(() {
          _currentSliderValue = range;
        });
      },
    );
  }
}

class BottomChoiceChip extends StatefulWidget {
  const BottomChoiceChip({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomChoiceChip> createState() => _BottomChoiceChipState();
}

class _BottomChoiceChipState extends State<BottomChoiceChip> {
  final List<int> _selectedIndexList = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 12.w,
      spacing: 12.w,
      children: List.generate(
        12,
        (index) {
          return ChoiceChip(
            selected: _selectedIndexList.contains(index),
            label: Text("$index"),
            selectedColor: ColorManager.secondaryColor,
            disabledColor: ColorManager.shadowColor,
            labelStyle: Theme.of(context).textTheme.caption!.copyWith(
                color: _selectedIndexList.contains(index)
                    ? Colors.white
                    : ColorManager.choiceChipUnselectedTextColor),
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedIndexList.add(index);
                } else {
                  _selectedIndexList.remove(index);
                }
              });
            },
          );
        },
      ),
    );
  }
}
