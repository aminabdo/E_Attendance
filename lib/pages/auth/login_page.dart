import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/forget_password_page.dart';
import 'package:qimma/pages/auth/signup_page.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/clickable_text.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_button2.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hideImage = false;
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();

    phoneFocusNode.addListener(onPhoneFoucesChangeListener);
    passwordFocusNode.addListener(onPasswordFoucesChangeListener);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: size.width,
                  height: hideImage ? size.height * .2 : size.height * .4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset('assets/images/logo.png').image,
                    ),
                  ),
                ),
                Text(
                  AppUtils.translate(context, 'welcome'),
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  AppUtils.translate(context, 'please_login_to_your_account'),
                  style: TextStyle(fontSize: 15),
                ),
                MyTextFormField(
                  focusNode: phoneFocusNode,
                  controller: phoneController,
                  keyboardType: TextInputType.text,
                  hintText:
                      AppUtils.translate(context, 'email_or_phone_number'),
                ),
                MyTextFormField(
                  focusNode: passwordFocusNode,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  hintText: AppUtils.translate(context, 'password'),
                  obscureText: hidePassword,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onTap: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                  ),
                ),
                space(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClickableText(
                      text: AppUtils.translate(context, 'forget_password'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ForgetPasswordPage(),
                          ),
                        );
                      },
                    ),
                    ClickableText(
                      text: AppUtils.translate(context, 'register_new'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SingupPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                space(),
                myButton(
                  AppUtils.translate(context, 'login').toUpperCase(),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                        (route) => false);
                  },
                  // btnColor: enableButton() ? secondColor : mainColor,
                ),
                space(),
                Center(
                  child: Text(
                    AppUtils.translate(context, 'or'),
                  ),
                ),
                space(),
                Row(
                  children: [
                    Expanded(
                      child: myButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo facebook.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppUtils.translate(context, 'facebook'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        btnColor: facebookColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: myButton2(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppUtils.translate(context, 'google'),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        btnColor: googleColor,
                      ),
                    ),
                  ],
                ),
                space(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget space() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }

  void onPhoneFoucesChangeListener() {
    if (phoneFocusNode.hasFocus) {
      hideImage = true;
      setState(() {});
    } else {
      hideImage = false;
      setState(() {});
    }
  }

  void onPasswordFoucesChangeListener() {
    if (passwordFocusNode.hasFocus) {
      hideImage = true;
      setState(() {});
    } else {
      hideImage = false;
      setState(() {});
    }
  }

  bool enableButton() {
    return phoneController.text.isEmpty || passwordController.text.isEmpty;
  }
}
