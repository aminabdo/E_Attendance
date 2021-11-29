import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:location/location.dart';
import 'package:E_Attendance/Bles/Bloc/AuthBloc.dart';
import 'package:E_Attendance/Bles/Model/Requests/SignupRequest.dart';
import 'package:E_Attendance/Bles/Model/Responses/old/auth/SignupResponse.dart';
import 'package:E_Attendance/E_Attendance_user/home_page.dart';
import 'package:E_Attendance/utils/app_patterns.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button.dart';
import 'package:E_Attendance/widgets/my_button2.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';
import 'package:E_Attendance/widgets/signup_background_image.dart';

class SingupPage extends StatefulWidget {
  @override
  _SingupPageState createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final ScreenUtil screenUtil = ScreenUtil();
  final formKey = GlobalKey<FormState>();

  bool loading = false;

  bool pickingLocation = false;

  File profileImage;

  LocationData _locationData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: loading,
      progressIndicator: Loader(),
      color: Colors.white,
      opacity: .5,
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SignupBackgroundImage(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenUtil.setWidth(10.0)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        space(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyAppBar(
                              text: 'register_new_account'.tr,
                            ),

                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        //
                        space(),
                        space(),
                        space(),
                        space(),
                        space(),
                        space(),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return 'required'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                controller: firstNameController,
                                keyboardType: TextInputType.text,
                                hintText:
                                'first_name'.tr,
                              ),
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(10),
                            ),
                            Expanded(
                              child: MyTextFormField(
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return 'required'.tr;
                                  } else {
                                    return null;
                                  }
                                },
                                controller: lastNameController,
                                keyboardType: TextInputType.text,
                                hintText:
                                'last_name'.tr,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        MyTextFormField(
                          validator: (String input) {
                            if (input.isEmpty) {
                              return 'required'.tr;
                            } else {
                              return null;
                            }
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: 'phone_number'.tr,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          validator: (String input) {
                            if (input.isEmpty) {
                              return 'required'.tr;
                            } else if (!PatternUtils.emailIsValid(
                                email: input)) {
                              return 'invalid_email_address'.tr;
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'email'.tr,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          validator: (String input) {
                            if (input.isEmpty) {
                              return  'required'.tr;
                            } else if (input.length < 8) {
                              return 'weak_password'.tr;
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          hintText:  'password'.tr,
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
                          validator: (String input) {
                            if (input.isEmpty) {
                              return  'required'.tr;
                            } else if (input != passwordController.text) {
                              return  'not_match'.tr;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText:
                               'confirm_password'.tr,
                          controller: confirmPasswordController,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'location_coordinates'.tr,
                                ),
                                _locationData == null
                                    ? SizedBox.shrink()
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: mainColor,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: screenUtil.setWidth(3),
                                          ),
                                          Text(
                                            'location_picked'.tr,
                                            style: TextStyle(
                                              color: mainColor,
                                              fontSize: screenUtil.setSp(12),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(15),
                            ),
                            Expanded(
                              child: MyButton2(
                                pickingLocation
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'pick_location'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                btnColor: Colors.blueGrey,
                                onTap: () async {
                                  setState(() {
                                    pickingLocation = true;
                                  });

                                  var locationPermissionGranted =
                                      await AppUtils.askLocationPermission();
                                  if (locationPermissionGranted) {
                                    Location location = new Location();

                                    bool _serviceEnabled;
                                    PermissionStatus _permissionGranted;

                                    _serviceEnabled =
                                        await location.serviceEnabled();
                                    if (!_serviceEnabled) {
                                      _serviceEnabled =
                                          await location.requestService();
                                      if (!_serviceEnabled) {
                                        AppUtils.showToast(
                                            msg: 'open_gps'.tr);
                                        setState(() {
                                          pickingLocation = false;
                                        });
                                        return;
                                      }
                                    }

                                    _permissionGranted =
                                        await location.hasPermission();
                                    if (_permissionGranted ==
                                        PermissionStatus.DENIED) {
                                      _permissionGranted =
                                          await location.requestPermission();
                                      if (_permissionGranted !=
                                          PermissionStatus.GRANTED) {
                                        AppUtils.showToast(
                                            msg: 'permission_denied'.tr);
                                        setState(() {
                                          pickingLocation = false;
                                        });
                                        return;
                                      }
                                    }

                                    _locationData =
                                        await location.getLocation();
                                    if (_locationData != null) {
                                      AppUtils.showToast(
                                          msg: "location_picked".tr);
                                    }
                                    setState(() {
                                      pickingLocation = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        space(),
                        MyButton(
                           'register'.tr.toUpperCase(),
                          onTap: () {
                            validateAndSignup(context);
                          },
                        ),
                        space(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget space() {
    return SizedBox(
      height: 20,
    );
  }

  void validateAndSignup(BuildContext context) async {
    if (formKey.currentState.validate()) {


      if (_locationData == null) {
        AppUtils.showToast(
            msg: 'please_provide_the_location_coordinates'.tr);
        return;
      }

      setState(() {
        loading = true;
      });

      SignupResponse response = await authBloc.signup(
        SignupRequest(
          fireBaseToken: AppUtils.firebaseToken,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
          phone: phoneController.text,
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          lat: _locationData.latitude.toString(),
          lng: _locationData.longitude.toString(),
          verifyType: '1',
          image: profileImage,
        ),
      );

      if (response.status == 1) {
        setState(() {
          loading = false;
        });

        AppUtils.userData = response.data;
        await AppUtils.saveUserData(response.data);

        Navigator.of(context)
            .pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => HomePage()), (route) => false)
            .then((value) {
          passwordController.clear();
          confirmPasswordController.clear();
          emailController.clear();
          phoneController.clear();
          firstNameController.clear();
          lastNameController.clear();
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
