import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qimma/Bles/Bloc/AuthBloc.dart';
import 'package:qimma/Bles/Model/Requests/LoginRequest.dart';
import 'package:qimma/pages/auth/forget_password_page.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/widgets/clickable_text.dart';
import 'package:qimma/widgets/login_background_image.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_loader.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScreenUtil screenUtil = ScreenUtil();

  bool loading = false;

  TextEditingController phoneOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: loading,
      progressIndicator: Loader(),
      color: Colors.white,
      opacity: .5,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                LoginBackgroundImage(),
                Wrap(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(screenUtil.setWidth(8)),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenUtil.setHeight(30) * 2,
                              ),
                              MyAppBar(
                                text: AppUtils.translate(context, 'login'),
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenUtil.setSp(18),
                                ),
                                onBackBtnPressed: () {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => WelcomePage()), (route) => false);
                                },
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(30) + screenUtil.setHeight(20),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/login_image.png',
                                  scale: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(30) * 1.3,
                              ),
                              MyTextFormField(
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return AppUtils.translate(context, 'required');
                                  }
                                },

                                hintText: AppUtils.translate(context, 'email_or_phone'),
                                controller: phoneOrEmailController,
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(30) - screenUtil.setHeight(10),
                              ),
                              MyTextFormField(
                                controller: passwordController,
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return AppUtils.translate(context, 'required');
                                  }
                                },
                                hintText: AppUtils.translate(context, 'password'),
                                obscureText: true,
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(30) - screenUtil.setHeight(20),
                              ),
                              Center(
                                child: MyButton(
                                  AppUtils.translate(context, 'login'),
                                  width: size.width * .5,
                                  onTap: () {
                                    validateAndLogin(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(15),
                              ),
                              Center(
                                child: ClickableText(
                                  text: AppUtils.translate(context, 'forget_password'),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(30) - screenUtil.setHeight(30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndLogin(BuildContext context) async {
    if(formKey.currentState.validate()) {

      AppUtils.hideKeyboard(context);

    setState(() {
      loading = true;
    });

    // var response = await authBloc.login(
    //   LoginRequest(
    //       eamilOrPhone: phoneOrEmailController.text,
    //       fireBaseToken: AppUtils.firebaseToken,
    //       password: passwordController.text,
    //   ),
    // );

      // 0548900632
    var response = await authBloc.login(
      LoginRequest(
          eamilOrPhone: "1091989539",//phoneOrEmailController.text.toString(),
          fireBaseToken: "AppUtils.firebaseToken",
          password: "123456",//passwordController.text.toString(),
      ),
    );

    if (response.status == 1) {
      setState(() {
        loading = false;
      });

      AppUtils.userData = response.data;
      await AppUtils.saveUserData(response.data);

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomePage()), (route) => false).then((value) {
        passwordController.clear();
        phoneOrEmailController.clear();
      });

    } else {
      AppUtils.showToast(msg: response.message);
      setState(() {
        loading = false;
       });
     }
    }
  }
}
