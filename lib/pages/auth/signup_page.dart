import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
                              text: AppUtils.translate(
                                  context, 'register_new_account'),
                            ),
                            Expanded(
                              child: Container(
                                height: screenUtil.setHeight(120),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        Image.asset('assets/images/logo.jpeg')
                                            .image,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        GestureDetector(
                          onTap: () async {
                            var permissionGranted =
                                await AppUtils.askPhotosPermission();
                            if (permissionGranted) {
                              var image = await AppUtils.getImage(1);
                              if (image != null) {
                                setState(() {
                                  profileImage = image[0];
                                });
                              }
                            } else {
                              AppUtils.showToast(
                                  msg: AppUtils.translate(
                                      context, 'permission_denied'));
                            }
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: profileImage == null
                                ? Image.asset('assets/images/avatar.jpg').image
                                : Image.file(profileImage).image,
                          ),
                        ),
                        space(),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return AppUtils.translate(
                                        context, 'required');
                                  } else {
                                    return null;
                                  }
                                },
                                controller: firstNameController,
                                keyboardType: TextInputType.text,
                                hintText:
                                    AppUtils.translate(context, 'first_name'),
                              ),
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(10),
                            ),
                            Expanded(
                              child: MyTextFormField(
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return AppUtils.translate(
                                        context, 'required');
                                  } else {
                                    return null;
                                  }
                                },
                                controller: lastNameController,
                                keyboardType: TextInputType.text,
                                hintText:
                                    AppUtils.translate(context, 'last_name'),
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
                              return AppUtils.translate(context, 'required');
                            } else if (!PatternUtils.phoneIsValid(
                                phone: input)) {
                              return AppUtils.translate(
                                  context, 'invalid_phone_number');
                            } else {
                              return null;
                            }
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: AppUtils.translate(context, 'phone_number'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          validator: (String input) {
                            if (input.isEmpty) {
                              return AppUtils.translate(context, 'required');
                            } else if (!PatternUtils.emailIsValid(
                                email: input)) {
                              return AppUtils.translate(
                                  context, 'invalid_email_address');
                            } else {
                              return null;
                            }
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: AppUtils.translate(context, 'email'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextFormField(
                          validator: (String input) {
                            if (input.isEmpty) {
                              return AppUtils.translate(context, 'required');
                            } else if (input.length < 8) {
                              return AppUtils.translate(
                                  context, 'weak_password');
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          hintText: AppUtils.translate(context, 'password'),
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
                              return AppUtils.translate(context, 'required');
                            } else if (input != passwordController.text) {
                              return AppUtils.translate(context, 'not_match');
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText:
                              AppUtils.translate(context, 'confirm_password'),
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
                                  AppUtils.translate(
                                      context, 'location_coordinates'),
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
                                            AppUtils.translate(
                                                context, 'location_picked'),
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
                                        AppUtils.translate(
                                            context, 'pick_location'),
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
                                            msg: AppUtils.translate(
                                                context, 'open_gps'));
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
                                            msg: AppUtils.translate(
                                                context, 'permission_denied'));
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
                                          msg: "تم اخذ الموقع بنجاح");
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
                          AppUtils.translate(context, 'register').toUpperCase(),
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
      if (profileImage == null) {
        AppUtils.showToast(msg: AppUtils.translate(context, 'choose_an_image'));
      }

      if (_locationData == null) {
        AppUtils.showToast(
            msg: AppUtils.translate(
                context, 'please_provide_the_location_coordinates'));
        return;
      }

      setState(() {
        loading = true;
      });

      SignupResponse response = await authBloc.signup(
        SignupRequest(
          fireBaseToken: 'jjjjjjjj', // AppUtils.firebaseToken,
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
