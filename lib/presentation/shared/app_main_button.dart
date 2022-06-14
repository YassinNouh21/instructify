import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class AppMainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final IconData? icon;
  const AppMainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          backgroundColor:
              MaterialStateProperty.all(color ?? ColorManager.secondaryColor)),
    );
  }
}
