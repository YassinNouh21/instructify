import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instructify/presentation/resource/assets_manager.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class ImageDisplayer extends StatelessWidget {
  const ImageDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsManager.welcomeIntro,
      width: SizeManager.s180,
      alignment: Alignment.center,
      color: ColorManager.secondaryColor,
    );
  }
}
