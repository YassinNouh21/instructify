import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/shared/secondary_app_bar.dart';

import 'widgets/account_button.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text('Account',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          SvgPicture.asset(AssetsManager.avatarIcon, width: 150.w),
          SizedBox(height: 35.h),
          AccountButton(
            title: 'Favorite',
            onPressed: () {},
          ),
          AccountButton(
            title: 'Edit Account',
            onPressed: () {},
          ),
          AccountButton(
            title: 'Settings and Privacy',
            onPressed: () {},
          ),
          AccountButton(
            title: 'Scan QR Code',
            onPressed: () {},
          ),
          AccountButton(
            title: 'Help',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
