import 'package:E_Attendance/utils/base/BaseResponse.dart';

class ClientOfRepresentativeResponse extends BaseResponse{
  int status;
  List<ClientBean> data;
  String message;

  static ClientOfRepresentativeResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ClientOfRepresentativeResponse clientOfRepresentativeResponseBean = ClientOfRepresentativeResponse();
    clientOfRepresentativeResponseBean.status = map['status'];
    clientOfRepresentativeResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => ClientBean.fromMap(o))
    );
    clientOfRepresentativeResponseBean.message = map['message'];
    return clientOfRepresentativeResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class ClientBean {
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
  dynamic lang;
  dynamic lat;
  dynamic lng;
  dynamic debt;
  dynamic currencyId;
  List<AddressesBean> addresses;

  static ClientBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ClientBean dataBean = ClientBean();
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
    dataBean.addresses = List()..addAll(
      (map['addresses'] as List ?? []).map((o) => AddressesBean.fromMap(o))
    );
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