import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              SizedBox(
                  width: 230.w,
                  child: Image.asset('assets/svg/connection.png')),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Ooops !',
                style: TextStyle(
                    fontSize: 30.sp,
                    color: const Color(0xFF7b7b7b),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'No Internet connection',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFF8a8a8a),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Check your connection',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: const Color(0xFF8a8a8a),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
