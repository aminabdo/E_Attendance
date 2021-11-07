import 'package:E_Attendance/utils/base/BaseResponse.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';

class LoginResponse extends BaseResponse {
  int status;
  String message;
  UserData data;

  LoginResponse({this.status, this.message, this.data});

  static LoginResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginResponse loginResponseBean = LoginResponse();
    loginResponseBean.status = map['status'];
    loginResponseBean.message = map['message'];
    loginResponseBean.data = UserData.fromMap(map['data']);
    return loginResponseBean;
  }

  Map toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}

class Attendance {
  int type;
  UserData user;
}

class UserData {
  int id = 1;
  String firstName = "amin";
  String lastName = "amin";
  String image = "";
  dynamic fireBaseToken;
  String phone = "01099020814";
  String email = "aminabdo43@gmail.com";
  dynamic status;
  dynamic social;
  String password;
  dynamic notification;
  dynamic message;
  String lang;
  String lat = "123";
  String lng = "123";
  String carNum;
  dynamic debt;
  dynamic currencyId;
  String token;
  String time = DateTime.now().toString();
  String finger = "test";
  String active = "1";

  UserData(
      {this.id = 1,
      this.firstName = "abdo",
      this.lastName = "amin",
      this.image = "",
      this.fireBaseToken,
      this.phone = "01099020814",
      this.email = "aminabdo43@gmail.com",
      this.status,
      this.social,
      this.notification,
      this.message,
      this.lang,
      this.lat,
      this.lng,
      this.carNum,
      this.debt,
      this.currencyId,
      this.password,
      this.time,
      this.finger = "test",
      this.active = "1",
      this.token});

  static UserData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserData dataBean = UserData();
    dataBean.id = map['id'];
    dataBean.firstName = map['first_name'];
    dataBean.password = map['password'];
    dataBean.lastName = map['last_name'];
    dataBean.image = map['image'];
    dataBean.fireBaseToken = map['fire_base_token'];
    dataBean.phone = map['phone'];
    dataBean.email = map['email'];
    dataBean.status = map['status'];
    dataBean.social = map['social'];
    dataBean.notification = map['notification'];
    dataBean.message = map['message'];
    dataBean.lang = map['lang'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.carNum = map['car_num'];
    dataBean.debt = map['debt'];
    dataBean.currencyId = map['currency_id'];
    dataBean.token = map['token'];
    dataBean.time = map['time'];
    dataBean.finger = map['finger'];
    dataBean.active = map['active'];
    return dataBean;
  }

  Map toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "fire_base_token": fireBaseToken,
        "phone": phone,
        "email": email,
        "status": status,
        "social": social,
        "notification": notification,
        "message": message,
        "lang": lang,
        "lat": lat,
        "lng": lng,
        "car_num": carNum,
        "debt": debt,
        "currency_id": currencyId,
        "time": DateFormat.Hms().format(DateTime.now()).toString(),
        "token": token,
        "password": password,
        "finger": md5.convert(utf8.encode("${finger} ${email}")).toString(),
        "active": active,
      };
}
