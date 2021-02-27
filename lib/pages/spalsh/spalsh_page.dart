import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/login_page.dart';
import 'package:qimma/utils/consts.dart';

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
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => LoginPage(),
          ),
        );
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
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash.png',
            scale: 1,
          ),
        ),
      ),
    );
  }
}
