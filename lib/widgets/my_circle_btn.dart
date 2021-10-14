
import 'package:flutter/material.dart';
import 'package:E_Attendance/utils/consts.dart';

class MuCircleButton extends StatelessWidget {

  final Function onTap;
  final Widget child;
  final elevation;
  final Color color;
  final bool mini;

  const MuCircleButton({Key key, this.onTap, this.elevation, this.color, this.mini, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: '${DateTime.now()} : ${DateTime.may}',
      onPressed: onTap ?? () {
        Navigator.pop(context,
        );
      },
      elevation: elevation ?? 0,
      focusElevation: elevation ??  0,
      highlightElevation: elevation ??  0,
      backgroundColor: color ?? secondColor,
      mini: mini ?? true,
      child: child ?? Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 18,
      ),
    );
  }
}
