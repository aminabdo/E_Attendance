import 'package:qimma/Bles/Model/Responses/old/home/FilterWebSiteResponse.dart';
import 'package:qimma/utils/base/BaseResponse.dart';

class SearchByNameResponse extends BaseResponse{
  List<ProductsBean> data;
  int status;
  String message;

  static SearchByNameResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SearchByNameResponse searchByNameResponseBean = SearchByNameResponse();
    searchByNameResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => ProductsBean.fromMap(o))
    );
    searchByNameResponseBean.status = map['status'];
    searchByNameResponseBean.message = map['message'];
    return searchByNameResponseBean;
  }

  Map toJson() => {
    "data": data,
    "status": status,
    "message": message,
  };
}
