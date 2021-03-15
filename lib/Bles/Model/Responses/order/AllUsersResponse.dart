import 'package:qimma/utils/base/BaseResponse.dart';

class AllUsersResponse extends BaseResponse{
  dynamic _status;
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
  String _phone;
  String _image;
  String _status;
  String _social;
  String _email;
  String _lat;
  String _lng;
  String _debt;
  dynamic _currencyId;
  String _code;
  dynamic _shopId;
  String _fireBaseToken;
  String _createdAt;
  String _updatedAt;
  String _catrPrice;
  dynamic _discountId;
  String _notification;
  dynamic _lang;
  String _message;
  String _isActive;

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phone => _phone;
  String get image => _image;
  String get status => _status;
  String get social => _social;
  String get email => _email;
  String get lat => _lat;
  String get lng => _lng;
  String get debt => _debt;
  dynamic get currencyId => _currencyId;
  String get code => _code;
  dynamic get shopId => _shopId;
  String get fireBaseToken => _fireBaseToken;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get catrPrice => _catrPrice;
  dynamic get discountId => _discountId;
  String get notification => _notification;
  dynamic get lang => _lang;
  String get message => _message;
  String get isActive => _isActive;

  Users({
      int id, 
      String firstName, 
      String lastName, 
      String phone, 
      String image, 
      String status, 
      String social, 
      String email, 
      String lat, 
      String lng, 
      String debt, 
      dynamic currencyId, 
      String code, 
      dynamic shopId, 
      String fireBaseToken, 
      String createdAt, 
      String updatedAt, 
      String catrPrice, 
      dynamic discountId, 
      String notification, 
      dynamic lang, 
      String message, 
      String isActive}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _image = image;
    _status = status;
    _social = social;
    _email = email;
    _lat = lat;
    _lng = lng;
    _debt = debt;
    _currencyId = currencyId;
    _code = code;
    _shopId = shopId;
    _fireBaseToken = fireBaseToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _catrPrice = catrPrice;
    _discountId = discountId;
    _notification = notification;
    _lang = lang;
    _message = message;
    _isActive = isActive;
}

  Users.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _phone = json["phone"];
    _image = json["image"];
    _status = json["status"];
    _social = json["social"];
    _email = json["email"];
    _lat = json["lat"];
    _lng = json["lng"];
    _debt = json["debt"];
    _currencyId = json["currency_id"];
    _code = json["code"];
    _shopId = json["shop_id"];
    _fireBaseToken = json["fire_base_token"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _catrPrice = json["catr_price"];
    _discountId = json["discount_id"];
    _notification = json["notification"];
    _lang = json["lang"];
    _message = json["message"];
    _isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["phone"] = _phone;
    map["image"] = _image;
    map["status"] = _status;
    map["social"] = _social;
    map["email"] = _email;
    map["lat"] = _lat;
    map["lng"] = _lng;
    map["debt"] = _debt;
    map["currency_id"] = _currencyId;
    map["code"] = _code;
    map["shop_id"] = _shopId;
    map["fire_base_token"] = _fireBaseToken;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["catr_price"] = _catrPrice;
    map["discount_id"] = _discountId;
    map["notification"] = _notification;
    map["lang"] = _lang;
    map["message"] = _message;
    map["is_active"] = _isActive;
    return map;
  }

}