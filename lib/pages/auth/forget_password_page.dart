import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/reset_password_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_button.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

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
                AppUtils.translate(context, 'are_you_forget_your_password'),
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                AppUtils.translate(context, 'forget_password_msg'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 4,
              ),
              MyTextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                hintText: AppUtils.translate(context, 'phone_number'),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: myButton(
                      AppUtils.translate(context, 'submit'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ResetPasswordPage(),
                        ),
                      );
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
