import 'dart:math' as math;
import 'package:flutter/material.dart';

class WelcomeBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(Localizations.localeOf(context).languageCode == 'en') {
      return Image.asset(
        'assets/images/a2.jpeg',
        fit: BoxFit.fill,
        scale: 1,
        width: size.width,
        height: size.height,
      );
    } else {
      return Image.asset(
        'assets/images/a2.jpeg',
        fit: BoxFit.fill,
        scale: 1,
        width: size.width,
        height: size.height,
      );
    }
  }
}
