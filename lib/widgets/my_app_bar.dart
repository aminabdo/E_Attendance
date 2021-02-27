import 'package:flutter/material.dart';
import 'package:qimma/utils/consts.dart';

class MyAppBar extends StatelessWidget {
  final String text;
  final Widget leading;
  final List<Widget> actions;
  final TextStyle textStyle;

  const MyAppBar(
      {Key key,
      @required this.text,
      this.leading,
      this.actions,
      this.textStyle,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            leading ?? FloatingActionButton(
              onPressed: () {
                Navigator.pop(context,
                );
              },
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              backgroundColor: secondColor,
              mini: true,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle ?? TextStyle(fontSize: 18),
            ),
          ].where((element) => element != null).toList(),
        ),
        Row(
          children: actions ?? [],
        )
      ].where((element) => element != null).toList(),
    );
  }
}
