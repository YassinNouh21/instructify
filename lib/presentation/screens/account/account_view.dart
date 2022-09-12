import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/application/bloc/favorite_bloc.dart';
import 'package:instructify/application/bloc/fetch_bloc.dart';
import 'package:instructify/injection.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/auth/authentication_bloc.dart';
import 'widgets/account_button.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              onPressed: () {
                debugPrint('favoriteCoursesPressed');

                Navigator.of(context).pushNamed(Routes.favoriteRoute);
              },
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
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (!state.isSubmitting) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.chooseSignInMehtodRoute, (route) => false);
                }
              },
              builder: (context, state) {
                if (state.isSubmitting) {
                  return CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.remove('user');
                      });
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationSignOut());
                    },
                    child: Text('Logout'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
