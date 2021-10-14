import 'package:E_Attendance/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:E_Attendance/utils/base/BaseResponse.dart';
import 'package:E_Attendance/Bles/Model/Responses/order/AllpdOrderResponse.dart';

class AddpdOrderResponse extends BaseResponse {
  int status;
  Order_AllPD data;
  String message;

  static AddpdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddpdOrderResponse addpdOrderResponseBean = AddpdOrderResponse();
    addpdOrderResponseBean.status = map['status'];
    addpdOrderResponseBean.data = Order_AllPD.fromMap(map['data']);
    addpdOrderResponseBean.message = map['message'];
    return addpdOrderResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
