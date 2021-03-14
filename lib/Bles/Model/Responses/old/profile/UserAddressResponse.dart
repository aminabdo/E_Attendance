import 'package:qimma/utils/base/BaseResponse.dart';

class UserAddressResponse extends BaseResponse{
  int status;
  List<DataBean> data;
  String message;

  static UserAddressResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserAddressResponse userAddressResponseBean = UserAddressResponse();
    userAddressResponseBean.status = map['status'];
    userAddressResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    userAddressResponseBean.message = map['message'];
    return userAddressResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int id;
  double lat;
  double lng;
  String address;
  String name;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.address = map['address'];
    dataBean.name = map['name'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "lat": lat,
    "lng": lng,
    "address": address,
    "name": name,
  };
}