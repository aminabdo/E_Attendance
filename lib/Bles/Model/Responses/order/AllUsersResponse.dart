import 'package:qimma/utils/base/BaseResponse.dart';

class AllUsersResponse extends BaseResponse {
  int _status;
  List<Users> _data;
  String _message;

  int get status => _status;
  List<Users> get data => _data;
  String get message => _message;

  AllUsersResponse({
      int status, 
      List<Users> data,
      String message}){
    _status = status;
    _data = data;
    _message = message;
}

  AllUsersResponse.fromJson(dynamic json) {
    _status = json["status"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Users.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

class Users {
  int _id;
  String _firstName;
  String _lastName;
  String _image;
  String _fireBaseToken;
  String _phone;
  String _email;
  int _status;
  int _social;
  int _notification;
  int _message;
  dynamic _lang;
  String _lat;
  String _lng;
  dynamic _debt;
  int _currencyId;
  List<Addresses> _addresses;
  List<String> _price_types;

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get image => _image;
  String get fireBaseToken => _fireBaseToken;
  String get phone => _phone;
  String get email => _email;
  int get status => _status;
  int get social => _social;
  int get notification => _notification;
  int get message => _message;
  dynamic get lang => _lang;
  String get lat => _lat;
  String get lng => _lng;
  int get debt => _debt;
  int get currencyId => _currencyId;
  List<Addresses> get addresses => _addresses;
  List<String> get priceType => _price_types;

  Users({
      int id, 
      String firstName, 
      String lastName, 
      String image, 
      String fireBaseToken, 
      String phone, 
      String email, 
      int status, 
      int social, 
      int notification, 
      int message, 
      dynamic lang, 
      String lat, 
      String lng, 
      int debt, 
      int currencyId, 
      List<Addresses> addresses,
      List<String> priceTypes}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _image = image;
    _fireBaseToken = fireBaseToken;
    _phone = phone;
    _email = email;
    _status = status;
    _social = social;
    _notification = notification;
    _message = message;
    _lang = lang;
    _lat = lat;
    _lng = lng;
    _debt = debt;
    _currencyId = currencyId;
    _addresses = addresses;
    _price_types = priceTypes;
}

  Users.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _image = json["image"];
    _fireBaseToken = json["fire_base_token"];
    _phone = json["phone"];
    _email = json["email"];
    _status = json["status"];
    _social = json["social"];
    _notification = json["notification"];
    _message = json["message"];
    _lang = json["lang"];
    _lat = json["lat"];
    _lng = json["lng"];
    _debt = json["debt"];
    _currencyId = json["currency_id"];
    if (json["addresses"] != null) {
      _addresses = [];
      json["addresses"].forEach((v) {
        _addresses.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["image"] = _image;
    map["fire_base_token"] = _fireBaseToken;
    map["phone"] = _phone;
    map["email"] = _email;
    map["status"] = _status;
    map["social"] = _social;
    map["notification"] = _notification;
    map["message"] = _message;
    map["lang"] = _lang;
    map["lat"] = _lat;
    map["lng"] = _lng;
    map["debt"] = _debt;
    map["currency_id"] = _currencyId;
    if (_addresses != null) {
      map["addresses"] = _addresses.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Addresses {
  int _id;
  String _userId;
  String _lat;
  String _lng;
  String _address;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get userId => _userId;
  String get lat => _lat;
  String get lng => _lng;
  String get address => _address;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Addresses({
      int id, 
      String userId, 
      String lat, 
      String lng, 
      String address, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _userId = userId;
    _lat = lat;
    _lng = lng;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Addresses.fromJson(dynamic json) {
    _id = json["id"];
    _userId = json["user_id"];
    _lat = json["lat"];
    _lng = json["lng"];
    _address = json["address"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["user_id"] = _userId;
    map["lat"] = _lat;
    map["lng"] = _lng;
    map["address"] = _address;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}