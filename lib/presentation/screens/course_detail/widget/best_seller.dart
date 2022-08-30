import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 100.w,
      child: Row(
        children: [
          Text('Best Seller'),
          Text('See All'),
        ],
      ),
    );
  }
}
