import 'package:flutter/material.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';

class SelectLocationPage extends StatelessWidget {
  final String title;

  const SelectLocationPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            elevation: 4,
            child: Container(
              width: size.width,
              height: size.height * .185,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    space(context),
                    MyAppBar(
                      text: title,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/images/select_location.png').image,
                    ),
                  ),
                ),
                Positioned(
                  child:  MyButton(
                    AppUtils.translate(context, 'add_location').toUpperCase(),
                    height: 40,
                    btnColor: mainColor,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  left: 10,
                  right: 10,
                  bottom: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
