import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class TermsText extends StatelessWidget {
  const TermsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      ' By Tapping Continues, Create Account or Use another Account. I agree to e-Course\’s Terms of Services, Privacy Policy',
      maxLines: 4,
      minFontSize: SizeManager.s8,
      maxFontSize: SizeManager.s14,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
