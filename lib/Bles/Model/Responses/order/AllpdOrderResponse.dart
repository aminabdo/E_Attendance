import 'package:qimma/utils/base/BaseResponse.dart';

class AllpdOrderResponse extends BaseResponse{
  int status;
  List<Order_AllPD> data;
  String message;

  static AllpdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AllpdOrderResponse allpdOrderResponseBean = AllpdOrderResponse();
    allpdOrderResponseBean.status = map['status'];
    allpdOrderResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => Order_AllPD.fromMap(o))
    );
    allpdOrderResponseBean.message = map['message'];
    return allpdOrderResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class Order_AllPD {
  int id;
  String priceType;
  dynamic discount;
  dynamic tax1;
  dynamic tax2;
  dynamic totalPrice;
  dynamic paid;
  dynamic rest;
  dynamic shippingPrice;
  String status;
  String email;
  String phone;
  String paymentMethod;
  dynamic rate;
  dynamic report;
  String date;
  String name;
  String userId;
  String representativeId;
  String representativeName;
  String lat;
  String lng;
  String address;
  List<Products_Order_Bean> products;
  dynamic notes;
  String createdAt;
  String updatedAt;

  static Order_AllPD fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Order_AllPD dataBean = Order_AllPD();
    dataBean.id = map['id'];
    dataBean.priceType = map['price_type'];
    dataBean.discount = map['discount'];
    dataBean.tax1 = map['tax1'];
    dataBean.tax2 = map['tax2'];
    dataBean.totalPrice = map['total_price'];
    dataBean.paid = map['paid'];
    dataBean.rest = map['rest'];
    dataBean.shippingPrice = map['shipping_price'];
    dataBean.status = map['status'];
    dataBean.email = map['email'];
    dataBean.phone = map['phone'];
    dataBean.paymentMethod = map['payment_method'];
    dataBean.rate = map['rate'];
    dataBean.report = map['report'];
    dataBean.date = map['date'];
    dataBean.name = map['name'];
    dataBean.userId = map['user_id'];
    dataBean.representativeId = map['representative_id'];
    dataBean.representativeName = map['representative_name'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.address = map['address'];
    dataBean.products = List()..addAll(
      (map['products'] as List ?? []).map((o) => Products_Order_Bean.fromMap(o))
    );
    dataBean.notes = map['notes'];
    dataBean.createdAt = map['created_at'];
    dataBean.updatedAt = map['updated_at'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "price_type": priceType,
    "discount": discount,
    "tax1": tax1,
    "tax2": tax2,
    "total_price": totalPrice,
    "paid": paid,
    "rest": rest,
    "shipping_price": shippingPrice,
    "status": status,
    "email": email,
    "phone": phone,
    "payment_method": paymentMethod,
    "rate": rate,
    "report": report,
    "date": date,
    "name": name,
    "user_id": userId,
    "representative_id": representativeId,
    "representative_name": representativeName,
    "lat": lat,
    "lng": lng,
    "address": address,
    "products": products,
    "notes": notes,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Products_Order_Bean {
  int id;
  String mainProductId;
  String mainProductName;
  String desc;
  String Difference;
  String image;
  dynamic quantity;
  dynamic price;
  dynamic color;
  dynamic size;

  static Products_Order_Bean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Products_Order_Bean productsBean = Products_Order_Bean();
    productsBean.id = map['id'];
    productsBean.mainProductId = map['main_product_id'];
    productsBean.mainProductName = map['main_Product_name'];
    productsBean.desc = map['desc'];
    productsBean.Difference = map['Difference'];
    productsBean.image = map['image'];
    productsBean.quantity = map['quantity'];
    productsBean.price = map['price'];
    productsBean.color = map['color'];
    productsBean.size = map['size'];
    return productsBean;
  }

  Map toJson() => {
    "id": id,
    "main_product_id": mainProductId,
    "main_Product_name": mainProductName,
    "desc": desc,
    "Difference": Difference,
    "image": image,
    "quantity": quantity,
    "price": price,
    "color": color,
    "size": size,
  };
}