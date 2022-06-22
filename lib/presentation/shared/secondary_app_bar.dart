import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resource/assets_manager.dart';

class SecondaryAppBar extends StatelessWidget {
  final String title;
  const SecondaryAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: IconButton(
            alignment: Alignment.topCenter,
            onPressed: () => Navigator.of(context).pop(),
            icon: SizedBox(
              width: 25.w,
              child: SvgPicture.asset(
                AssetsManager.backIcon,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'All Topics',
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
