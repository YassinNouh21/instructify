import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class AppMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final IconData? icon;
  final double? width;
  const AppMainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.width,
    this.color,
  }) : super(key: key);

  factory AppMainButton.fixeWidth(
    VoidCallback onPressed,
    String text,
    Color? color,
    IconData? icon,
    double? width,
  ) =>
      AppMainButton(
        onPressed: onPressed,
        text: text,
        color: color,
        icon: icon,
        width: width ?? SizeManager.s325,
      );
  factory AppMainButton.fullWidth({
    required VoidCallback onPressed,
    required String text,
    Color? color,
    IconData? icon,
    double? widthQuery,
  }) =>
      AppMainButton(
        onPressed: onPressed,
        text: text,
        color: color,
        icon: icon,
        width: widthQuery ?? double.infinity,
      );

  @override
  Widget build(BuildContext context) {
    print(toString());
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Container(
                margin: const EdgeInsets.only(right: SizeManager.s28),
                child: FaIcon(
                  icon,
                  size: SizeManager.s20,
                ),
              ),
            Text(text),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                color ?? ColorManager.secondaryColor)),
      ),
    );
  }
}
