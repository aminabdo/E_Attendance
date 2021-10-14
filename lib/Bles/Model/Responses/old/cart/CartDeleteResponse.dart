import 'package:E_Attendance/utils/base/BaseResponse.dart';

class CartDeleteResponse extends BaseResponse {
  int status;
  String message;
  dynamic data;

  static CartDeleteResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CartDeleteResponse cartDeleteResponseBean = CartDeleteResponse();
    cartDeleteResponseBean.status = map['status'];
    cartDeleteResponseBean.message = map['message'];
    cartDeleteResponseBean.data = map['data'];
    return cartDeleteResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}