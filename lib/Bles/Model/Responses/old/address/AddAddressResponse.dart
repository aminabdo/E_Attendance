import 'package:qimma/utils/base/BaseResponse.dart';

class AddAddressResponse extends BaseResponse {
  int status;
  DataBean data;
  String message;

  static AddAddressResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddAddressResponse addAddressResponseBean = AddAddressResponse();
    addAddressResponseBean.status = map['status'];
    addAddressResponseBean.data = DataBean.fromMap(map['data']);
    addAddressResponseBean.message = map['message'];
    return addAddressResponseBean;
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