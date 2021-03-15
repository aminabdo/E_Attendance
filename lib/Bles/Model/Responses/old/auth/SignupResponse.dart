import 'package:qimma/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:qimma/utils/base/BaseResponse.dart';

class SignupResponse extends BaseResponse {
  int status;
  String message;
  UserData data;

  static SignupResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SignupResponse signupResponseBean = SignupResponse();
    signupResponseBean.status = map['status'];
    signupResponseBean.message = map['message'];
    signupResponseBean.data = UserData.fromMap(map['data']);
    return signupResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}