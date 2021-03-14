import 'package:qimma/utils/base/BaseRequest.dart';

class LoginRequest extends BaseRequest {
  String eamilOrPhone;
  String password;
  String fireBaseToken;

  LoginRequest({this.eamilOrPhone, this.password, this.fireBaseToken});

  static LoginRequest fromMap(Map<String, dynamic> map) {
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