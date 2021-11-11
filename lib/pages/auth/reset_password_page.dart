import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:E_Attendance/pages/auth/login_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/widgets/forget_password_background_image.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool hidePassword = true;

  bool hideConfirmPassword = true;
  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ForgetPasswordBackgroundImage(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2,
                    ),
                    MyAppBar(text: ''),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + screenUtil.setHeight(50),
                    ),
                    Text(
                      'create_new_password'.tr,
                      style: TextStyle(fontSize: screenUtil.setSp(24)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'reset_password_msg'.tr,
                      style: TextStyle(fontSize: screenUtil.setSp(14)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2,
                    ),
                    MyTextFormField(
                      hintText: 'new_password'.tr,
                      obscureText: hidePassword,
                      suffixIcon: GestureDetector(
                        child: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onTap: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    MyTextFormField(
                      obscureText: hideConfirmPassword,
                      hintText: 'confirm_password'.tr,
                      suffixIcon: GestureDetector(
                        child: Icon(
                          hideConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onTap: () {
                          hideConfirmPassword = !hideConfirmPassword;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2.2,
                    ),
                    Center(
                      child: MyButton(
                        'submit'.tr,
                        width: size.width * .5,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LoginPage(),
                              ),
                              (_) => false,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
