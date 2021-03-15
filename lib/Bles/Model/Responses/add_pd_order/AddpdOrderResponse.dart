import 'package:qimma/Bles/Model/Responses/order/SinglepdOrder.dart';
import 'package:qimma/utils/base/BaseResponse.dart';

class AddpdOrderResponse extends BaseResponse {
  int status;
  Order data;
  String message;

  static AddpdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddpdOrderResponse addpdOrderResponseBean = AddpdOrderResponse();
    addpdOrderResponseBean.status = map['status'];
    addpdOrderResponseBean.data = Order.fromMap(map['data']);
    addpdOrderResponseBean.message = map['message'];
    return addpdOrderResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
