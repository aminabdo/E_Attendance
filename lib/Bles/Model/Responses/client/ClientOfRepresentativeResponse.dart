import 'package:qimma/utils/base/BaseResponse.dart';

/// status : 1
/// data : [{"id":305,"first_name":"mostafa","last_name":"hussien","image":"https://qimmaapi.codecaique.com/public/images/users/9039549511615123273.jpg","fire_base_token":null,"phone":"01200000000","email":"mhe@gmail.com","status":1,"social":0,"notification":1,"message":1,"lang":null,"lat":"29.076321","lng":"31.09693","debt":777,"currency_id":0,"dicounts_codes":[{"id":26,"name_ar":"Winter Sale","name_en":"??? ??????","desc_ar":"??? ???? 2021","desc_en":"2021 winter sale","code":"30","amount":"20","amount_type":"percentage","end_date":"2020-02-15","is_use":0}]},{"id":329,"first_name":"????","last_name":"???????","image":"https://qimmaapi.codecaique.com/public/images/users/","fire_base_token":null,"phone":"012164546544","email":"l@l.com","status":1,"social":0,"notification":0,"message":1,"lang":"en","lat":"21654654","lng":"485445456","debt":57633,"currency_id":1,"dicounts_codes":[]}]
/// message : "success"

class ClientOfRepresentativeResponse extends BaseResponse {
  int status;
  List<DataBean> data;
  String message;

  static ClientOfRepresentativeResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ClientOfRepresentativeResponse clientOfRepresentative =
        ClientOfRepresentativeResponse();
    clientOfRepresentative.status = map['status'];
    clientOfRepresentative.data = List()
      ..addAll((map['data'] as List ?? []).map((o) => DataBean.fromMap(o)));
    clientOfRepresentative.message = map['message'];
    return clientOfRepresentative;
  }

  Map toJson() => {
        "status": status,
        "data": data,
        "message": message,
      };
}

/// id : 305
/// first_name : "mostafa"
/// last_name : "hussien"
/// image : "https://qimmaapi.codecaique.com/public/images/users/9039549511615123273.jpg"
/// fire_base_token : null
/// phone : "01200000000"
/// email : "mhe@gmail.com"
/// status : 1
/// social : 0
/// notification : 1
/// message : 1
/// lang : null
/// lat : "29.076321"
/// lng : "31.09693"
/// debt : 777
/// currency_id : 0
/// dicounts_codes : [{"id":26,"name_ar":"Winter Sale","name_en":"??? ??????","desc_ar":"??? ???? 2021","desc_en":"2021 winter sale","code":"30","amount":"20","amount_type":"percentage","end_date":"2020-02-15","is_use":0}]

class DataBean {
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
  dynamic lang;
  String lat;
  String lng;
  int debt;
  int currencyId;
  List<Dicounts_codesBean> dicountsCodes;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
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
    dataBean.dicountsCodes = List()
      ..addAll((map['dicounts_codes'] as List ?? [])
          .map((o) => Dicounts_codesBean.fromMap(o)));
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
        "dicounts_codes": dicountsCodes,
      };
}

/// id : 26
/// name_ar : "Winter Sale"
/// name_en : "??? ??????"
/// desc_ar : "??? ???? 2021"
/// desc_en : "2021 winter sale"
/// code : "30"
/// amount : "20"
/// amount_type : "percentage"
/// end_date : "2020-02-15"
/// is_use : 0

class Dicounts_codesBean {
  int id;
  String nameAr;
  String nameEn;
  String descAr;
  String descEn;
  String code;
  String amount;
  String amountType;
  String endDate;
  int isUse;

  static Dicounts_codesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Dicounts_codesBean dicounts_codesBean = Dicounts_codesBean();
    dicounts_codesBean.id = map['id'];
    dicounts_codesBean.nameAr = map['name_ar'];
    dicounts_codesBean.nameEn = map['name_en'];
    dicounts_codesBean.descAr = map['desc_ar'];
    dicounts_codesBean.descEn = map['desc_en'];
    dicounts_codesBean.code = map['code'];
    dicounts_codesBean.amount = map['amount'];
    dicounts_codesBean.amountType = map['amount_type'];
    dicounts_codesBean.endDate = map['end_date'];
    dicounts_codesBean.isUse = map['is_use'];
    return dicounts_codesBean;
  }

  Map toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "desc_ar": descAr,
        "desc_en": descEn,
        "code": code,
        "amount": amount,
        "amount_type": amountType,
        "end_date": endDate,
        "is_use": isUse,
      };
}
