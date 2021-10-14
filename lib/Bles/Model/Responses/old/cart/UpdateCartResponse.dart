import 'package:E_Attendance/utils/base/BaseResponse.dart';

class UpdateCartResponse extends BaseResponse {
  int status;
  DataBean data;
  String message;

  static UpdateCartResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UpdateCartResponse updateCartResponseBean = UpdateCartResponse();
    updateCartResponseBean.status = map['status'];
    updateCartResponseBean.data = DataBean.fromMap(map['data']);
    updateCartResponseBean.message = map['message'];
    return updateCartResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  List<My_cartBean> myCart;
  int productsPrice;
  int shippingPrice;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.myCart = List()..addAll(
      (map['my_cart'] as List ?? []).map((o) => My_cartBean.fromMap(o))
    );
    dataBean.productsPrice = map['products_price'];
    dataBean.shippingPrice = map['shipping_price'];
    return dataBean;
  }

  Map toJson() => {
    "my_cart": myCart,
    "products_price": productsPrice,
    "shipping_price": shippingPrice,
  };
}

class My_cartBean {
  int id;
  String name;
  String desc;
  String productDetailDesc;
  String productDetailDifference;
  String image;
  String rate;
  String price;
  int isOffer;
  String offerAmount;
  double lat;
  double lng;
  bool isFavorite;
  ColorBean color;
  SizeBean size;
  int quantity;

  static My_cartBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    My_cartBean my_cartBean = My_cartBean();
    my_cartBean.id = map['id'];
    my_cartBean.name = map['name'];
    my_cartBean.desc = map['desc'];
    my_cartBean.productDetailDesc = map['product_detail_desc'];
    my_cartBean.productDetailDifference = map['product_detail_difference'];
    my_cartBean.image = map['image'];
    my_cartBean.rate = map['rate'];
    my_cartBean.price = map['price'];
    my_cartBean.isOffer = map['is_offer'];
    my_cartBean.offerAmount = map['offer_amount'];
    my_cartBean.lat = map['lat'];
    my_cartBean.lng = map['lng'];
    my_cartBean.isFavorite = map['is_favorite'];
    my_cartBean.color = ColorBean.fromMap(map['color']);
    my_cartBean.size = SizeBean.fromMap(map['size']);
    my_cartBean.quantity = map['quantity'];
    return my_cartBean;
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