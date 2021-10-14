import 'package:E_Attendance/Bles/Model/Responses/old/home/FilterWebSiteResponse.dart';
import 'package:E_Attendance/utils/base/BaseRequest.dart';
import 'package:E_Attendance/utils/base/BaseResponse.dart';

class SingleProductResponse extends BaseResponse {
  int status;
  ProductsBean data;
  String message;

  static SingleProductResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SingleProductResponse singleProductBean = SingleProductResponse();
    singleProductBean.status = map['status'];
    singleProductBean.data = ProductsBean.fromMap(map['data']);
    singleProductBean.message = map['message'];
    return singleProductBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
