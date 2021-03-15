import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qimma/utils/consts.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String label;
  final Function(String input) validator, onChanged, onSubmit;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final Color borderColor;
  final TextStyle lableStyle;
  final TextStyle hintStyle;
  final double borderWidth;
  final BoxDecoration decoration;
  final FocusNode focusNode;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Color bgColor;
  final String errorMsg;
  final bool enable;
  final double radius;

  MyTextFormField({
    Key key,
    this.hintText = '',
    this.maxLines,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.label = '',
    this.onSubmit,
    this.borderColor,
    this.borderWidth,
    this.lableStyle,
    this.decoration,
    this.hintStyle,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.bgColor,
    this.errorMsg,
    this.enable = true, this.radius,
  }) : super(key: key);

  final double borderRadius = 15;
  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor ?? secondColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(radius ?? borderRadius),
          ),
          child: TextFormField(
            textAlign: TextAlign.justify,
            maxLines: maxLines ?? 1,
            keyboardType: keyboardType,
            onFieldSubmitted: onSubmit,
            focusNode: focusNode,
            enabled: enable,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                contentPadding: EdgeInsets.only(
                  top: screenUtil.setHeight(5),
                  left: screenUtil.setWidth(10),
                  right: screenUtil.setWidth(10),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? borderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? mainColor,
                    width: borderWidth ?? 2.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? borderRadius),
                  borderSide: BorderSide(
                    color: borderColor ?? mainColor,
                    width: borderWidth ?? 2.3,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? borderRadius),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: borderWidth ?? 2.3,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? borderRadius),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: borderWidth ?? 2.3,
                  ),
                ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon),
            obscureText: obscureText,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
