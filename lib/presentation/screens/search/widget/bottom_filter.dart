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
                ],
              ));
        });
  }
}
