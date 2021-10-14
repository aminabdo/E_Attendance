import 'package:E_Attendance/utils/base/BaseResponse.dart';

class AllClientsResponse extends BaseResponse {
  int status;
  List<Client> data;
  String message;

  static AllClientsResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AllClientsResponse allClientsResponseBean = AllClientsResponse();
    allClientsResponseBean.status = map['status'];
    allClientsResponseBean.data = List()
      ..addAll((map['data'] as List ?? []).map((o) => Client.fromMap(o)));
    allClientsResponseBean.message = map['message'];
    return allClientsResponseBean;
  }

  Map toJson() => {
        "status": status,
        "data": data,
        "message": message,
      };
}

/// id : 342
/// first_name : "Abanoub"
/// last_name : "Fakhery"
/// image : "https://qimmaapi.codecaique.com/public/images/users/11645252291615464694.png"
/// fire_base_token : "jjjjjjjj"
/// phone : "01023798556"
/// email : "abanoub728@gmail.com"
/// status : 0
/// social : 0
/// notification : 1
/// message : 1
/// lang : null
/// lat : "37.4220014"
/// lng : "-122.084013"
/// debt : 140646.68
/// currency_id : 0
/// addresses : [{"id":180,"user_id":"342","lat":"29.076321","lng":"31.09693","address":"Beni Suef","created_at":"2021-03-11 12:32:20","updated_at":"2021-03-11 12:32:20"}]

class Client {
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
  dynamic lang;
  String lat;
  String lng;
  dynamic debt;
  int currencyId;
  List<AddressesBean> addresses;

  static Client fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Client dataBean = Client();
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
    dataBean.debt = map['debt'];
    dataBean.currencyId = map['currency_id'];
    dataBean.addresses = List()
      ..addAll((map['addresses'] as List ?? [])
          .map((o) => AddressesBean.fromMap(o)));
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
        "debt": debt,
        "currency_id": currencyId,
        "addresses": addresses,
      };
}

/// id : 180
/// user_id : "342"
/// lat : "29.076321"
/// lng : "31.09693"
/// address : "Beni Suef"
/// created_at : "2021-03-11 12:32:20"
/// updated_at : "2021-03-11 12:32:20"

class AddressesBean {
  int id;
  String userId;
  String lat;
  String lng;
  String address;
  String createdAt;
  String updatedAt;

  static AddressesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddressesBean addressesBean = AddressesBean();
    addressesBean.id = map['id'];
    addressesBean.userId = map['user_id'];
    addressesBean.lat = map['lat'];
    addressesBean.lng = map['lng'];
    addressesBean.address = map['address'];
    addressesBean.createdAt = map['created_at'];
    addressesBean.updatedAt = map['updated_at'];
    return addressesBean;
  }

  Map toJson() => {
        "id": id,
        "user_id": userId,
        "lat": lat,
        "lng": lng,
        "address": address,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
