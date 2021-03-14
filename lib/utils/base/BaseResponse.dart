import 'package:dio/dio.dart';

class BaseResponse  {
  int status;
  String message;
  bool loading = true ;
  static BaseResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BaseResponse baseResponseBean = BaseResponse();
    baseResponseBean.status = map['status'];
    baseResponseBean.message = map['message'];
    return baseResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
  };
}

