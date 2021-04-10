import 'package:qimma/utils/base/BaseResponse.dart';

class SetDeptResponse extends BaseResponse {
  int status;
  DataBean data;
  String message;

  static SetDeptResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SetDeptResponse setDeptResponseBean = SetDeptResponse();
    setDeptResponseBean.status = map['status'];
    setDeptResponseBean.data = DataBean.fromMap(map['data']);
    setDeptResponseBean.message = map['message'];
    return setDeptResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int id;
  RepresentativeBean representative;
  UserBean user;
  String type;
  dynamic value;
  String date;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.representative = RepresentativeBean.fromMap(map['representative']);
    dataBean.user = UserBean.fromMap(map['user']);
    dataBean.type = map['type'];
    dataBean.value = map['value'];
    dataBean.date = map['date'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "representative": representative,
    "user": user,
    "type": type,
    "value": value,
    "date": date,
  };
}

class UserBean {
  int id;
  String firstName;
  String lastName;
  String phone;
  String image;
  String status;
  String social;
  String email;
  String lat;
  String lng;
  String debt;
  dynamic currencyId;
  dynamic code;
  String shopId;
  dynamic fireBaseToken;
  String createdAt;
  String updatedAt;
  dynamic catrPrice;
  dynamic discountId;
  String notification;
  dynamic lang;
  String message;
  String isActive;

  static UserBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserBean userBean = UserBean();
    userBean.id = map['id'];
    userBean.firstName = map['first_name'];
    userBean.lastName = map['last_name'];
    userBean.phone = map['phone'];
    userBean.image = map['image'];
    userBean.status = map['status'];
    userBean.social = map['social'];
    userBean.email = map['email'];
    userBean.lat = map['lat'];
    userBean.lng = map['lng'];
    userBean.debt = map['debt'];
    userBean.currencyId = map['currency_id'];
    userBean.code = map['code'];
    userBean.shopId = map['shop_id'];
    userBean.fireBaseToken = map['fire_base_token'];
    userBean.createdAt = map['created_at'];
    userBean.updatedAt = map['updated_at'];
    userBean.catrPrice = map['catr_price'];
    userBean.discountId = map['discount_id'];
    userBean.notification = map['notification'];
    userBean.lang = map['lang'];
    userBean.message = map['message'];
    userBean.isActive = map['is_active'];
    return userBean;
  }

  Map toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "image": image,
    "status": status,
    "social": social,
    "email": email,
    "lat": lat,
    "lng": lng,
    "debt": debt,
    "currency_id": currencyId,
    "code": code,
    "shop_id": shopId,
    "fire_base_token": fireBaseToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "catr_price": catrPrice,
    "discount_id": discountId,
    "notification": notification,
    "lang": lang,
    "message": message,
    "is_active": isActive,
  };
}

class RepresentativeBean {
  int id;
  String firstName;
  String lastName;
  String phone;
  dynamic image;
  String status;
  String social;
  String email;
  String lat;
  String lng;
  String debt;
  dynamic currencyId;
  dynamic code;
  String shopId;
  String fireBaseToken;
  String createdAt;
  String updatedAt;
  String catrPrice;
  dynamic discountId;
  String notification;
  dynamic lang;
  String message;
  String isActive;

  static RepresentativeBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RepresentativeBean representativeBean = RepresentativeBean();
    representativeBean.id = map['id'];
    representativeBean.firstName = map['first_name'];
    representativeBean.lastName = map['last_name'];
    representativeBean.phone = map['phone'];
    representativeBean.image = map['image'];
    representativeBean.status = map['status'];
    representativeBean.social = map['social'];
    representativeBean.email = map['email'];
    representativeBean.lat = map['lat'];
    representativeBean.lng = map['lng'];
    representativeBean.debt = map['debt'];
    representativeBean.currencyId = map['currency_id'];
    representativeBean.code = map['code'];
    representativeBean.shopId = map['shop_id'];
    representativeBean.fireBaseToken = map['fire_base_token'];
    representativeBean.createdAt = map['created_at'];
    representativeBean.updatedAt = map['updated_at'];
    representativeBean.catrPrice = map['catr_price'];
    representativeBean.discountId = map['discount_id'];
    representativeBean.notification = map['notification'];
    representativeBean.lang = map['lang'];
    representativeBean.message = map['message'];
    representativeBean.isActive = map['is_active'];
    return representativeBean;
  }

  Map toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "image": image,
    "status": status,
    "social": social,
    "email": email,
    "lat": lat,
    "lng": lng,
    "debt": debt,
    "currency_id": currencyId,
    "code": code,
    "shop_id": shopId,
    "fire_base_token": fireBaseToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "catr_price": catrPrice,
    "discount_id": discountId,
    "notification": notification,
    "lang": lang,
    "message": message,
    "is_active": isActive,
  };
}