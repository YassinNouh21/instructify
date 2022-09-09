import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instructify/application/auth/authentication_bloc.dart';

class BottomContainer extends StatelessWidget {
  final VoidCallback onPressedFavorite;
  bool? isFavorite;
  final VoidCallback onPressedBuy;
  BottomContainer({
    Key? key,
    required this.onPressedFavorite,
    this.isFavorite,
    required this.onPressedBuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 2.h),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(children: [
        SizedBox(
          width: 25.w,
        ),
        InkWell(
          onTap: onPressedFavorite,
          splashColor: Colors.amberAccent,
          child: Center(
            child: Container(
              width: 100.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: const Color(0xFFFFEBF0),
              ),
              child: Icon(
                !isFavorite! ? Icons.star_border : Icons.star,
                size: 20.w,
                color: const Color(0xFFFF6905),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        ElevatedButton(
          onPressed: onPressedBuy,
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF3D5CFF),
            fixedSize: Size(250.w, 60.h),
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 15.h,
            ),
          ),
          child: const Text('Buy Now'),
        ),
      ]),
    );
  }
}
