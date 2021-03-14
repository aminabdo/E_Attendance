import 'package:qimma/utils/base/BaseResponse.dart';

class AddToCartResponse extends BaseResponse {
  int status;
  String message;
  dynamic data;

  static AddToCartResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddToCartResponse addToCartResponseBean = AddToCartResponse();
    addToCartResponseBean.status = map['status'];
    addToCartResponseBean.message = map['message'];
    addToCartResponseBean.data = map['data'];
    return addToCartResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}