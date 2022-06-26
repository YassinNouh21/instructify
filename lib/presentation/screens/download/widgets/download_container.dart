import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/color_manager.dart';

import '../../../resource/assets_manager.dart';

class DownloadContainer extends StatelessWidget {
  const DownloadContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(20.h),
      child: Row(
        children: [
          Text(
            '01',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: ColorManager.shadowColor),
          ),
          SizedBox(
            width: 25.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to the download screen',
                    style: Theme.of(context).textTheme.subtitle1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '6:10   min',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorManager.secondaryColor,
                          ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SvgPicture.asset(
                      AssetsManager.downloadedIcon,
                      width: 13.w,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            iconSize: 45.w,
            icon: SvgPicture.asset(
              AssetsManager.playIcon,
              fit: BoxFit.cover,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
