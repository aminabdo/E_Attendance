import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:qimma/utils/consts.dart';

class MyButton2 extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color btnColor;
  final BoxDecoration decoration;
  final double width;
  final double height;
  final EdgeInsets margin;

  MyButton2(
    this.child, {
    Key key,
    this.onTap,
    this.btnColor,
    this.decoration,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: margin,
      height: height ?? screenUtil.setHeight(70),
      decoration: decoration ??
          BoxDecoration(
            color: btnColor ?? mainColor,
            borderRadius: BorderRadius.circular(16),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(12),),
            child: child,
          ),
        ),
      ),
    );
  }
}