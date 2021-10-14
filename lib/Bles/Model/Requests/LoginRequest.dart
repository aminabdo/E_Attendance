import 'package:E_Attendance/utils/base/BaseRequest.dart';

class LoginRequest extends BaseRequest {
  String eamilOrPhone;
  String password;
  String fireBaseToken;

  LoginRequest({this.eamilOrPhone = "email or phone", this.password = "password",
    this.fireBaseToken = "token firebase"});

  static LoginRequest fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    LoginRequest loginRequestBean = LoginRequest();
    loginRequestBean.eamilOrPhone = map['eamilOrPhone'];
    loginRequestBean.password = map['password'];
    loginRequestBean.fireBaseToken = map['fire_base_token'];
    return loginRequestBean;
  }

  Map toJson() => {
    "eamilOrPhone": eamilOrPhone,
    "password": password,
    "fire_base_token": fireBaseToken,
  };
}