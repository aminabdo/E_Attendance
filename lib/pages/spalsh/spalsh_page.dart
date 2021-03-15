import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/welcome_page.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/widgets/welcome_background_image.dart';

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
        if(AppUtils.userData == null) {
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
              'assets/images/logo.png',
            ),
          ],
        ),
      ),
    );
  }
}
