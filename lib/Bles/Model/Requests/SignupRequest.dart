import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qimma/utils/base/BaseRequest.dart';

class SignupRequest extends BaseRequest 
{
  String phone;
  String email;
  String firstName;
  String lastName;
  String lat;
  String lng;
  String password;
  String passwordConfirmation;
  String verifyType;
  File image;
  String fireBaseToken;


  SignupRequest(
      {this.phone,
      this.email,
      this.firstName,
      this.lastName,
      this.lat,
      this.lng,
      this.password,
      this.passwordConfirmation,
      this.verifyType,
      this.image,
      this.fireBaseToken,
      });

  static SignupRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SignupRequest signupResponseBean = SignupRequest();
    signupResponseBean.phone = map['phone'];
    signupResponseBean.email = map['email'];
    signupResponseBean.firstName = map['first_name'];
    signupResponseBean.lastName = map['last_name'];
    signupResponseBean.lat = map['lat'];
    signupResponseBean.lng = map['lng'];
    signupResponseBean.password = map['password'];
    signupResponseBean.passwordConfirmation = map['password_confirmation'];
    signupResponseBean.verifyType = map['verify_type'];
    signupResponseBean.image = map['image'];
    signupResponseBean.fireBaseToken = map['fire_base_token'];
    return signupResponseBean;
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      "phone": phone,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "lat": lat,
      "lng": lng,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "verify_type": verifyType,
      "image": await MultipartFile.fromFile(image.path),
      "fire_base_token": fireBaseToken,
    };
  }
}