import 'package:flutter/material.dart';
import 'package:E_Attendance/pages/auth/welcome_page.dart';
import 'package:E_Attendance/E_Attendance_user/home_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/widgets/welcome_background_image.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () async {
        // AppUtils.firebaseToken = await AppUtils.firebaseMesseging.getToken();
        AppUtils.userData = await AppUtils.getUserData();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => WelcomePage(),
          ),
        );
        if (AppUtils.userData == null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => WelcomePage(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            WelcomeBackgroundImage(),
            Image.asset(
              'assets/images/logo.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
