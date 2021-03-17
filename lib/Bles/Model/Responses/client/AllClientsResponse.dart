
class Client {
  int status;
  List<Data> data;
  String message;

  Client({this.status, this.data, this.message});

  Client.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
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
  Null lang;
  String lat;
  String lng;
  double debt;
  int currencyId;
  List<Addresses> addresses;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.image,
        this.fireBaseToken,
        this.phone,
        this.email,
        this.status,
        this.social,
        this.notification,
        this.message,
        this.lang,
        this.lat,
        this.lng,
        this.debt,
        this.currencyId,
        this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    fireBaseToken = json['fire_base_token'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    social = json['social'];
    notification = json['notification'];
    message = json['message'];
    lang = json['lang'];
    lat = json['lat'];
    lng = json['lng'];
    debt = json['debt'];
    currencyId = json['currency_id'];
    if (json['addresses'] != null) {
      addresses = new List<Addresses>();
      json['addresses'].forEach((v) {
        addresses.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['fire_base_token'] = this.fireBaseToken;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['status'] = this.status;
    data['social'] = this.social;
    data['notification'] = this.notification;
    data['message'] = this.message;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['debt'] = this.debt;
    data['currency_id'] = this.currencyId;
    if (this.addresses != null) {
      data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int id;
  String userId;
  String lat;
  String lng;
  String address;
  String createdAt;
  String updatedAt;

  Addresses(
      {this.id,
        this.userId,
        this.lat,
        this.lng,
        this.address,
        this.createdAt,
        this.updatedAt});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}