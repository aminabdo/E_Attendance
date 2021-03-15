import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qimma/pages/auth/login_page.dart';
import 'package:qimma/pages/auth/signup_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/welcome_background_image.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            WelcomeBackgroundImage(),
            Padding(
              padding: EdgeInsets.all(screenUtil.setWidth(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top * 2 + screenUtil.setHeight(25),
                  ),
                  Text(
                    AppUtils.translate(context, 'store_on_internet'),
                    style: TextStyle(color: mainColor, fontSize: screenUtil.setSp(20)),
                  ),
                  Text(
                    AppUtils.translate(context, 'lets_shopping'),
                    style: TextStyle(color: Colors.black, fontSize: screenUtil.setSp(17)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.top - screenUtil.setHeight(10),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/shop_image.png',
                        scale: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.top * 1.3,
                  ),
                  Center(
                    child: MyButton(
                      AppUtils.translate(context, 'create_account'),
                      width: size.width * .5,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SingupPage(),),);
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Center(
                    child: MyButton(
                      AppUtils.translate(context, 'login'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage(),),);
                      },
                      textStyle: TextStyle(color: mainColor),
                      width: size.width * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: mainColor, width: 1),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}