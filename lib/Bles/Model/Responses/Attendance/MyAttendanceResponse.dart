import 'package:qimma/utils/base/BaseResponse.dart';

class MyAttendanceResponse extends BaseResponse {
  int status;
  List<DataBean> data;
  String message;

  static MyAttendanceResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MyAttendanceResponse myAttendanceRespons = MyAttendanceResponse();
    myAttendanceRespons.status = map['status'];
    myAttendanceRespons.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    myAttendanceRespons.message = map['message'];
    return myAttendanceRespons;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int id;
  String status;
  String notes;
  String createdAt;
  RepresentativeBean representative;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.status = map['status'];
    dataBean.notes = map['notes'];
    dataBean.createdAt = map['created_at'];
    dataBean.representative = RepresentativeBean.fromMap(map['representative']);
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "status": status,
    "notes": notes,
    "created_at": createdAt,
    "representative": representative,
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