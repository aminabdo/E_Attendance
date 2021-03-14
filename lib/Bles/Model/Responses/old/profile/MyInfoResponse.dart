import 'package:qimma/utils/base/BaseResponse.dart';

class MyInfoResponse extends BaseResponse {
  int status;
  DataBean data;
  String message;

  static MyInfoResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MyInfoResponse myInfoResponseBean = MyInfoResponse();
    myInfoResponseBean.status = map['status'];
    myInfoResponseBean.data = DataBean.fromMap(map['data']);
    myInfoResponseBean.message = map['message'];
    return myInfoResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int id;
  String firstName;
  String lastName;
  String image;
  dynamic fireBaseToken;
  String phone;
  String email;
  int status;
  int social;
  int notification;
  int message;
  dynamic lang;
  String lat;
  String lng;
  int currencyId;
  dynamic token;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.firstName = map['first_name'];
    dataBean.lastName = map['last_name'];
    dataBean.image = map['image'];
    dataBean.fireBaseToken = map['fire_base_token'];
    dataBean.phone = map['phone'];
    dataBean.email = map['email'];
    dataBean.status = map['status'];
    dataBean.social = map['social'];
    dataBean.notification = map['notification'];
    dataBean.message = map['message'];
    dataBean.lang = map['lang'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.currencyId = map['currency_id'];
    dataBean.token = map['token'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "image": image,
    "fire_base_token": fireBaseToken,
    "phone": phone,
    "email": email,
    "status": status,
    "social": social,
    "notification": notification,
    "message": message,
    "lang": lang,
    "lat": lat,
    "lng": lng,
    "currency_id": currencyId,
    "token": token,
  };
}