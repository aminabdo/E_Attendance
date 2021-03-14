import 'package:qimma/utils/base/BaseResponse.dart';

class LoginResponse extends BaseResponse{
  int status;
  String message;
  User data;

  static LoginResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginResponse loginResponseBean = LoginResponse();
    loginResponseBean.status = map['status'];
    loginResponseBean.message = map['message'];
    loginResponseBean.data = User.fromMap(map['data']);
    return loginResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}

class User {
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
  String lang;
  String lat;
  String lng;
  String carNum;
  int debt;
  int currencyId;
  String token;

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    User dataBean = User();
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