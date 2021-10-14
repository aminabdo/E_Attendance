import 'package:flutter/material.dart';
import 'package:E_Attendance/utils/consts.dart';

class MyAppBar extends StatelessWidget {
  final String text;
  final Widget leading;
  final List<Widget> actions;
  final TextStyle textStyle;
  final Function onBackBtnPressed;

  const MyAppBar({
    Key key,
    @required this.text,
    this.leading,
    this.actions,
    this.textStyle,
    this.onBackBtnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ??
                FloatingActionButton(
                  onPressed: onBackBtnPressed ??
                      () {
                        Navigator.pop(
                          context,
                        );
                      },
                  elevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  backgroundColor: mainColor,
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
            //trailing ?? Container()
          ].where((element) => element != null).toList(),
        ),
        actions == null
            ? null
            : Row(
                children: actions.where((element) => element != null).toList(),
              )
      ].where((element) => element != null).toList(),
    );
  }
}
