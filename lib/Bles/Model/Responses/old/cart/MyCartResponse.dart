import 'package:qimma/utils/base/BaseResponse.dart';

class MyCartResponse extends BaseResponse {
  List<CartItemBean> data;
  String message;
  int status;

  static MyCartResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MyCartResponse myCartResponseBean = MyCartResponse();
    myCartResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => CartItemBean.fromMap(o))
    );
    myCartResponseBean.message = map['message'];
    myCartResponseBean.status = map['status'];
    return myCartResponseBean;
  }

  Map toJson() => {
    "data": data,
    "message": message,
    "status": status,
  };
}

class CartItemBean {
  int id;
  String name;
  String desc;
  String productDetailDesc;
  String productDetailDifference;
  String image;
  dynamic rate;
  String price;
  int isOffer;
  String offerAmount;
  double lat;
  double lng;
  bool isFavorite;
  ColorBean color;
  SizeBean size;
  int quantity;

  static CartItemBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CartItemBean dataBean = CartItemBean();
    dataBean.id = map['id'];
    dataBean.name = map['name'];
    dataBean.desc = map['desc'];
    dataBean.productDetailDesc = map['product_detail_desc'];
    dataBean.productDetailDifference = map['product_detail_difference'];
    dataBean.image = map['image'];
    dataBean.rate = map['rate'];
    dataBean.price = map['price'];
    dataBean.isOffer = map['is_offer'];
    dataBean.offerAmount = map['offer_amount'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.isFavorite = map['is_favorite'];
    dataBean.color = ColorBean.fromMap(map['color']);
    dataBean.size = SizeBean.fromMap(map['size']);
    dataBean.quantity = map['quantity'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "product_detail_desc": productDetailDesc,
    "product_detail_difference": productDetailDifference,
    "image": image,
    "rate": rate,
    "price": price,
    "is_offer": isOffer,
    "offer_amount": offerAmount,
    "lat": lat,
    "lng": lng,
    "is_favorite": isFavorite,
    "color": color,
    "size": size,
    "quantity": quantity,
  };
}

class SizeBean {
  int id;
  String name;

  static SizeBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SizeBean sizeBean = SizeBean();
    sizeBean.id = map['id'];
    sizeBean.name = map['name'];
    return sizeBean;
  }

  Map toJson() => {
    "id": id,
    "name": name,
  };
}

class ColorBean {
  int id;
  String colorCode;

  static ColorBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ColorBean colorBean = ColorBean();
    colorBean.id = map['id'];
    colorBean.colorCode = map['color_code'];
    return colorBean;
  }

  Map toJson() => {
    "id": id,
    "color_code": colorCode,
  };
}