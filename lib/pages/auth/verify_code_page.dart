
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:E_Attendance/pages/auth/reset_password_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/widgets/forget_password_background_image.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class VerfyCodePage extends StatelessWidget {

  final ScreenUtil screenUtil = ScreenUtil();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              ForgetPasswordBackgroundImage(),
              Padding(
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
                    Text('verify_code'.tr, style: TextStyle(fontSize: screenUtil.setSp(24)), textAlign: TextAlign.center,),
                    Text('verify_msg'.tr, style: TextStyle(fontSize: screenUtil.setSp(14)), textAlign: TextAlign.center,),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2,
                    ),
                    MyTextFormField(
                      hintText: 'code'.tr,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.top * 2.2,
                    ),
                    Center(
                      child: MyButton(
                        'next'.tr,
                        width: size.width * .5,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPasswordPage(),),);
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
