import 'package:qimma/utils/base/BaseResponse.dart';

import 'SinglepdOrder.dart';

class AllpdOrderResponse extends BaseResponse {
  int status;
  List<Order> data;
  String message;

  static AllpdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AllpdOrderResponse allpdOrderResponseBean = AllpdOrderResponse();
    allpdOrderResponseBean.status = map['status'];
    allpdOrderResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => Order.fromMap(o))
    );
    allpdOrderResponseBean.message = map['message'];
    return allpdOrderResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
