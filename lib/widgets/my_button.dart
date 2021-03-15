import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qimma/utils/consts.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color btnColor;
  final BoxDecoration decoration;
  final double width;
  final TextStyle textStyle;
  final double height;
  final EdgeInsets margin;

  MyButton(this.title, {Key key, this.onTap, this.btnColor, this.decoration, this.width, this.textStyle, this.height, this.margin}) : super(key: key);

  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: margin,
      height: (screenUtil.setHeight(height ?? 60)),
      decoration: decoration ??
          BoxDecoration(
            color: btnColor ?? mainColor,
            borderRadius: BorderRadius.circular(16),
          ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(12),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: screenUtil.setSp(16),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}