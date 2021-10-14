import 'package:E_Attendance/utils/base/BaseResponse.dart';

/// status : 1
/// data : {"id":3,"status":"attend","notes":"9 ?????","created_at":"2021-03-24T17:34:34.000000Z","representative":{"id":326,"first_name":"mostafaaa","last_name":"hussieen","phone":"012165955777777","image":null,"status":"2","social":"0","email":"nknk656413212@n111n1.com","lat":"21654654","lng":"485445456","debt":"31216","currency_id":null,"code":null,"shop_id":"10","fire_base_token":"AppUtils.firebaseToken","created_at":"2021-02-20 02:15:03","updated_at":"2021-03-24 10:47:32","catr_price":"0","discount_id":null,"notification":"1","lang":null,"message":"1","is_active":"1"}}
/// message : "success"

class AddAttendanceResponse extends BaseResponse{
  int status;
  DataBean data;
  String message;

  static AddAttendanceResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddAttendanceResponse addAttendanceResponse = AddAttendanceResponse();
    addAttendanceResponse.status = map['status'];
    addAttendanceResponse.data = DataBean.fromMap(map['data']);
    addAttendanceResponse.message = map['message'];
    return addAttendanceResponse;
  }

  Map toJson() => {
        "status": status,
        "data": data,
        "message": message,
      };
}

/// id : 3
/// status : "attend"
/// notes : "9 ?????"
/// created_at : "2021-03-24T17:34:34.000000Z"
/// representative : {"id":326,"first_name":"mostafaaa","last_name":"hussieen","phone":"012165955777777","image":null,"status":"2","social":"0","email":"nknk656413212@n111n1.com","lat":"21654654","lng":"485445456","debt":"31216","currency_id":null,"code":null,"shop_id":"10","fire_base_token":"AppUtils.firebaseToken","created_at":"2021-02-20 02:15:03","updated_at":"2021-03-24 10:47:32","catr_price":"0","discount_id":null,"notification":"1","lang":null,"message":"1","is_active":"1"}

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

/// id : 326
/// first_name : "mostafaaa"
/// last_name : "hussieen"
/// phone : "012165955777777"
/// image : null
/// status : "2"
/// social : "0"
/// email : "nknk656413212@n111n1.com"
/// lat : "21654654"
/// lng : "485445456"
/// debt : "31216"
/// currency_id : null
/// code : null
/// shop_id : "10"
/// fire_base_token : "AppUtils.firebaseToken"
/// created_at : "2021-02-20 02:15:03"
/// updated_at : "2021-03-24 10:47:32"
/// catr_price : "0"
/// discount_id : null
/// notification : "1"
/// lang : null
/// message : "1"
/// is_active : "1"

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
