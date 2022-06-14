import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class TextUnderImage extends StatelessWidget {
  const TextUnderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'Welcome to E-Courses',
          maxLines: 1,
          minFontSize: SizeManager.s18,
          maxFontSize: SizeManager.s26,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: SizeManager.s4),
        AutoSizeText(
          'Learn Useful Knowledge Everyday',
          maxLines: 1,
          minFontSize: SizeManager.s10,
          maxFontSize: SizeManager.s18,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
