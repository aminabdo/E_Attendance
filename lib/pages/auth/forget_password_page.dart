import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:E_Attendance/pages/auth/verify_code_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/widgets/forget_password_background_image.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';

class ForgetPasswordPage extends StatelessWidget {

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
                padding: EdgeInsets.all(screenUtil.setWidth(8.0)),
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
                    Text(AppUtils.translate(context, 'are_you_forget_your_password'),
                      style: TextStyle(fontSize: screenUtil.setSp(24)),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenUtil.setWidth(8.0)),
                      child: Text(AppUtils.translate(context, 'forget_password_msg'),
                        style: TextStyle(fontSize: screenUtil.setSp(14),
                        ), textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2,
                    ),
                    MyTextFormField(
                      hintText: AppUtils.translate(context, 'phone_number'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2.2,
                    ),
                    Center(
                      child: MyButton(
                        AppUtils.translate(context, 'next'),
                        width: size.width * .5,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerfyCodePage(),),);
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
