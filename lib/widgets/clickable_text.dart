import 'package:flutter/material.dart';
import 'package:qimma/utils/consts.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  const ClickableText({Key key, @required this.text, this.onTap, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ?? TextStyle(
          color: mainColor,
        ),
      ),
    );
  }
}
