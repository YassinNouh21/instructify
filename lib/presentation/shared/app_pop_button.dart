import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class AppPopButton extends StatelessWidget {
  const AppPopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_rounded,
        size: SizeManager.s26,
        color: Colors.black,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
