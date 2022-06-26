import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

class DownloadAppBar extends StatelessWidget {
  const DownloadAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.secondaryColor,
      height: 105.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Download',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 200.w,
          ),
          IconButton(
            iconSize: 40.w,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              AssetsManager.avatarIcon,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.accountRoute);
            },
          ),
        ],
      ),
    );
  }
}
