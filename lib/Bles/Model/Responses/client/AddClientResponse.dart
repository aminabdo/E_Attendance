import 'package:qimma/utils/base/BaseResponse.dart';

class AddClientResponse extends BaseResponse{
  int status;
  String message;
  DataBean data;

  static AddClientResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddClientResponse addClientResponseBean = AddClientResponse();
    addClientResponseBean.status = map['status'];
    addClientResponseBean.message = map['message'];
    addClientResponseBean.data = DataBean.fromMap(map['data']);
    return addClientResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}

class DataBean {
  String phone;
  String email;
  String firstName;
  String lastName;
  String lat;
  String lng;
  dynamic fireBaseToken;
  String status;
  int social;
  int isActive;
  String lang;
  int code;
  String updatedAt;
  String createdAt;
  int id;
  String token;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.phone = map['phone'];
    dataBean.email = map['email'];
    dataBean.firstName = map['first_name'];
    dataBean.lastName = map['last_name'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.fireBaseToken = map['fire_base_token'];
    dataBean.status = map['status'];
    dataBean.social = map['social'];
    dataBean.isActive = map['is_active'];
    dataBean.lang = map['lang'];
    dataBean.code = map['code'];
    dataBean.updatedAt = map['updated_at'];
    dataBean.createdAt = map['created_at'];
    dataBean.id = map['id'];
    dataBean.token = map['token'];
    return dataBean;
  }

  Map toJson() => {
    "phone": phone,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "lat": lat,
    "lng": lng,
    "fire_base_token": fireBaseToken,
    "status": status,
    "social": social,
    "is_active": isActive,
    "lang": lang,
    "code": code,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
    "token": token,
  };
}