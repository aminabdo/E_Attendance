import 'package:qimma/utils/base/BaseResponse.dart';

class SignupResponse extends BaseResponse {
  int status;
  String message;
  UserData data;

  static SignupResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SignupResponse signupResponseBean = SignupResponse();
    signupResponseBean.status = map['status'];
    signupResponseBean.message = map['message'];
    signupResponseBean.data = UserData.fromMap(map['data']);
    return signupResponseBean;
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
  String fireBaseToken;
  String phone;
  String email;
  int status;
  int social;
  int notification;
  int message;
  String lang;
  String lat;
  String lng;
  int currencyId;
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