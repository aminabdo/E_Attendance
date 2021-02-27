import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/login_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  bool hidePassword = true;

  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: [
              space(context),
              MyAppBar(
                text: '',
              ),
              space(context),
              Text(
                AppUtils.translate(context, 'create_new_password'),
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                AppUtils.translate(context, 'rest_password_msg'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 4,
              ),
              MyTextFormField(
                controller: codeController,
                keyboardType: TextInputType.phone,
                hintText: AppUtils.translate(context, 'code'),
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: myButton(
                    AppUtils.translate(context, 'submit'),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
