import 'dart:convert';
import 'dart:developer';

import 'package:qimma/utils/base/BaseRequest.dart';
import 'package:qimma/utils/base/BaseResponse.dart';

class AllpdOrderResponse extends BaseResponse implements BaseRequest{
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

class Order_AllPD extends BaseRequest {
  dynamic id;
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
  dynamic representativeId;
  String representativeName;
  dynamic lat;
  dynamic lng;
  String address;
  List<Products_Order_Bean> products;
  dynamic notes;
  String createdAt;
  String updatedAt;

  String prePrice;
  String discountType;
  String tax1Type;
  String tax2Type;
  dynamic addressId;

  calctotal(){
    double total = 0 ;
    products.forEach((element) {
      total += (element.quantity * element.price);
    });
    // total = total -
    //     double.parse(discount.toString().replaceAll('%', ''))
    //     + double.parse(tax1.toString().replaceAll('%', ''))
    //     + double.parse(tax2.toString().replaceAll('%', ''));
    totalPrice = total ;
    log("total model -----> ${totalPrice}");

  }

  Order_AllPD(
      {this.id,
      this.priceType,
      this.discount,
      this.tax1,
      this.tax2,
      this.totalPrice,
      this.paid,
      this.rest,
      this.shippingPrice,
      this.status,
      this.email,
      this.phone,
      this.paymentMethod,
      this.rate,
      this.report,
      this.date,
      this.name,
      this.userId,
      this.representativeId,
      this.representativeName,
      this.lat,
      this.lng,
      this.address,
      this.products,
      this.notes,
      this.createdAt,
      this.updatedAt,
      this.prePrice,
      this.discountType,
      this.tax1Type,
      this.tax2Type,
      this.addressId});

  static Order_AllPD fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Order_AllPD allpdOrderBean = Order_AllPD();
    allpdOrderBean.id = map['id'];
    allpdOrderBean.priceType = map['price_type'];
    allpdOrderBean.discount = map['discount'];
    allpdOrderBean.tax1 = map['tax1'];
    allpdOrderBean.tax2 = map['tax2'];
    allpdOrderBean.totalPrice = map['total_price'];
    allpdOrderBean.paid = map['paid'];
    allpdOrderBean.rest = map['rest'];
    allpdOrderBean.shippingPrice = map['shipping_price'];
    allpdOrderBean.status = map['status'];
    allpdOrderBean.email = map['email'];
    allpdOrderBean.phone = map['phone'];
    allpdOrderBean.paymentMethod = map['payment_method'];
    allpdOrderBean.rate = map['rate'];
    allpdOrderBean.report = map['report'];
    allpdOrderBean.date = map['date'];
    allpdOrderBean.name = map['name'];
    allpdOrderBean.userId = map['user_id'];
    allpdOrderBean.representativeId = map['representative_id'];
    allpdOrderBean.representativeName = map['representative_name'];
    allpdOrderBean.lat = map['lat'];
    allpdOrderBean.lng = map['lng'];
    allpdOrderBean.address = map['address'];

    allpdOrderBean.notes = map['notes'];
    allpdOrderBean.createdAt = map['created_at'];
    allpdOrderBean.updatedAt = map['updated_at'];



    allpdOrderBean.id = map['id'];
    allpdOrderBean.priceType = map['price_type'];
    allpdOrderBean.prePrice = map['pre_price'];
    allpdOrderBean.discountType = map['discount_type'];
    allpdOrderBean.discount = map['discount'];
    allpdOrderBean.tax1Type = map['tax1_type'];
    allpdOrderBean.tax1 = map['tax1'];
    allpdOrderBean.tax2Type = map['tax2_type'];
    allpdOrderBean.tax2 = map['tax2'];
    allpdOrderBean.totalPrice = map['total_price'];
    allpdOrderBean.paid = map['paid'];
    allpdOrderBean.rest = map['rest'];
    allpdOrderBean.shippingPrice = map['shipping_price'];
    allpdOrderBean.status = map['status'];
    allpdOrderBean.email = map['email'];
    allpdOrderBean.phone = map['phone'];
    allpdOrderBean.paymentMethod = map['payment_method'];
    allpdOrderBean.rate = map['rate'];
    allpdOrderBean.report = map['report'];
    allpdOrderBean.date = map['date'];
    allpdOrderBean.name = map['name'];
    allpdOrderBean.userId = map['user_id'];
    allpdOrderBean.representativeId = map['representative_id'];
    allpdOrderBean.representativeName = map['representative_name'];
    allpdOrderBean.lat = map['lat'];
    allpdOrderBean.lng = map['lng'];
    allpdOrderBean.addressId = map['address_id'];
    allpdOrderBean.address = map['address'];
    allpdOrderBean.products = List()..addAll(
        (map['products'] as List ?? []).map((o) => Products_Order_Bean.fromMap(o))
    );
    allpdOrderBean.notes = map['notes'];
    allpdOrderBean.createdAt = map['created_at'];
    allpdOrderBean.updatedAt = map['updated_at'];

    return allpdOrderBean;
  }

  Map toJson() {
    var json = jsonEncode(products.map((e) => e.toJson()).toList());
    return
    {
      "id"
    : id,
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
    "products": (products.map((e) => e.toJson()).toList()),
    "notes": notes,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pre_price": prePrice,
    "discount_type": discountType,
    "tax1_type": tax1Type,
    "tax2_type": tax2Type,
    "address_id": addressId,
    };
  }
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
  ColorBean color;
  SizeBean size;

  Products_Order_Bean(
      {this.id,
      this.mainProductId,
      this.desc,
      this.Difference,
      this.image,
      this.quantity,
      this.price,
      this.color,
      this.size});

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
    productsBean.color = ColorBean.fromMap(map['color']);
    productsBean.size = SizeBean.fromMap(map['size']);
    return productsBean;
  }

  @override
  String toString() {
    return '{id: $id, '
        'main_product_id: $mainProductId, '
        'main_Product_name: $mainProductName, '
        'desc: $desc, '
        'Difference: ${Difference ?? ''}, '
        'image: $image, '
        'quantity: $quantity,'
        ' price: $price, '
        'color_id: ${color?.id ?? ''}, '
        'size_id: ${size?.id ?? ''}}';
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
    "color_id": color?.id ?? '',
    "size_id": size?.id ?? '',
  };
}

class SizeBean {
  dynamic id;
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
  dynamic id;
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