import 'package:qimma/utils/base/BaseResponse.dart';

class LoginResponse extends BaseResponse{
  int status;
  String message;
  UserData data;

  static LoginResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginResponse loginResponseBean = LoginResponse();
    loginResponseBean.status = map['status'];
    loginResponseBean.message = map['message'];
    loginResponseBean.data = UserData.fromMap(map['data']);
    return loginResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}

class UserData {
  int id;
  String firstName;
  String lastName;
  String image;
  dynamic fireBaseToken;
  String phone;
  String email;
  dynamic status;
  dynamic social;
  dynamic notification;
  dynamic message;
  String lang;
  String lat;
  String lng;
  String carNum;
  dynamic debt;
  dynamic currencyId;
  String token;

  static UserData fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserData dataBean = UserData();
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
    dataBean.carNum = map['car_num'];
    dataBean.debt = map['debt'];
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
    "car_num": carNum,
    "debt": debt,
    "currency_id": currencyId,
    "token": token,
  };
}