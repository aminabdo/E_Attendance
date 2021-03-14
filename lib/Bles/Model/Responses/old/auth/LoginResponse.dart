import 'package:qimma/utils/base/BaseResponse.dart';

import 'SignupResponse.dart';

class LoginResponse extends BaseResponse {
  int status;
  String message;
  UserData data;

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
