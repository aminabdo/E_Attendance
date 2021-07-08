import 'package:dio/dio.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/base/BaseRequest.dart';

class BaseResponse {
  int status;
  String message;
  bool loading = true ;
  static BaseResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BaseResponse baseResponseBean = BaseResponse();
    baseResponseBean.status = map['status'];
    if(baseResponseBean.status  == 3){
      AppUtils.removeUserData();
    }
    baseResponseBean.message = map['message'];
    return baseResponseBean;
  }


  Map toJson() => {
    "status": status,
    "message": message,
  };
}

