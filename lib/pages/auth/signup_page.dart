import 'package:flutter/material.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                space(),
                MyAppBar(
                  text: AppUtils.translate(context, 'register_new_account'),
                ),
                space(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: Image.asset('assets/images/person.png').image,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -7,
                      right: -7,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: mainColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image:
                                Image.asset('assets/images/upload.png').image,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                space(),
                myButton(
                  AppUtils.translate(context, 'upload_photo'),
                  height: 45,
                  onTap: () {},
                  textStyle: TextStyle(
                    color: mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  width: size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: mainColor),
                    color: secondColor,
                  ),
                ),
                MyTextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  hintText: AppUtils.translate(context, 'username'),
                ),
                MyTextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppUtils.translate(context, 'email'),
                ),
                MyTextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: AppUtils.translate(context, 'phone_number'),
                ),
                MyTextFormField(
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
                MyTextFormField(
                  keyboardType: TextInputType.text,
                  hintText: AppUtils.translate(context, 'confirm_password'),
                  obscureText: hideConfirmPassword,
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
                space(),
                myButton(
                  AppUtils.translate(context, 'register').toUpperCase(),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                  },
                  // btnColor: enableButton() ? mainColor : secondColor,
                ),
                space(),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppUtils.translate(context, 'signup_t1'),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                          AppUtils.translate(context, 'signup_t2'),
                          style: TextStyle(fontSize: 16, color: mainColor, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                          AppUtils.translate(context, 'signup_t3'),
                          style: TextStyle(fontSize: 16, color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool enableButton() {
    return userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  Widget space() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
