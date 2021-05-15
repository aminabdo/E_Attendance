import 'package:qimma/utils/base/BaseResponse.dart';

import 'AllpdOrderResponse.dart';

class SinglepdOrderResponse extends BaseResponse {
  int status;
  Order_AllPD AllpdOrder;
  String message;


  @override
  String toString() {
    return 'SinglepdOrderResponse{status: $status, AllpdOrder: $AllpdOrder, message: $message}';
  }

  static SinglepdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SinglepdOrderResponse singlepdOrderBean = SinglepdOrderResponse();
    singlepdOrderBean.status = map['status'];
    singlepdOrderBean.AllpdOrder = Order_AllPD.fromMap(map['data']);
    singlepdOrderBean.message = map['message'];
    return singlepdOrderBean;
  }

  Map toJson() => {
    "status": status,
    "AllpdOrder": AllpdOrder,
    "message": message,
  };
}
