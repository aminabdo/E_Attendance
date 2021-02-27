
import 'package:flutter/material.dart';
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

  const MyTextFormField({
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
    this.hintStyle, this.focusNode, this.suffixIcon, this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: lableStyle ??
              TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          decoration: decoration ?? BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: secondColor,
          ),
          child: TextFormField(
            textAlign: TextAlign.justify,
            maxLines: obscureText ?? false ? 1 : maxLines,
            keyboardType: keyboardType,
            onFieldSubmitted: onSubmit,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? mainColor,
                  width: borderWidth ?? 2.3,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: borderWidth ?? 2.3,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: borderWidth ?? 2.3,
                ),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon
            ),
            obscureText: obscureText,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
