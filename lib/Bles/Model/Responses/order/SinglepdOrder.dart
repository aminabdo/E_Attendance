import 'package:qimma/utils/base/BaseResponse.dart';

class SinglepdOrderResponse extends BaseResponse {
  int status;
  Order data;
  String message;

  static SinglepdOrderResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SinglepdOrderResponse singlepdOrderBean = SinglepdOrderResponse();
    singlepdOrderBean.status = map['status'];
    singlepdOrderBean.data = Order.fromMap(map['data']);
    singlepdOrderBean.message = map['message'];
    return singlepdOrderBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class Order {
  int id;
  String priceType;
  dynamic totalPrice;
  int paid;
  dynamic rest;
  int shippingPrice;
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
  String lat;
  String lng;
  String address;
  List<ProductsBean> products;
  String createdAt;
  String updatedAt;

  static Order fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Order dataBean = Order();
    dataBean.id = map['id'];
    dataBean.priceType = map['price_type'];
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
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.address = map['address'];
    dataBean.products = List()..addAll(
      (map['products'] as List ?? []).map((o) => ProductsBean.fromMap(o))
    );
    dataBean.createdAt = map['created_at'];

    dataBean.updatedAt = map['updated_at'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "price_type": priceType,
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
    "lat": lat,
    "lng": lng,
    "address": address,
    "products": products,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class ProductsBean {
  int id;
  Product_detailBean ProductDetail;
  String pDOrderId;
  String productDetailId;
  int quantity;
  String colorId;
  String sizeId;
  ColorBean color;
  SizeBean size;

  static ProductsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProductsBean productsBean = ProductsBean();
    productsBean.id = map['id'];
    productsBean.ProductDetail = Product_detailBean.fromMap(map['Product_detail']);
    productsBean.pDOrderId = map['p_d_order_id'];
    productsBean.productDetailId = map['product_detail_id'];
    productsBean.quantity = map['quantity'];
    productsBean.colorId = map['color_id'];
    productsBean.sizeId = map['size_id'];
    productsBean.color = ColorBean.fromMap(map['color']);
    productsBean.size = SizeBean.fromMap(map['size']);
    return productsBean;
  }

  Map toJson() => {
    "id": id,
    "Product_detail": ProductDetail,
    "p_d_order_id": pDOrderId,
    "product_detail_id": productDetailId,
    "quantity": quantity,
    "color_id": colorId,
    "size_id": sizeId,
    "color": color,
    "size": size,
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

class Product_detailBean {
  int id;
  String productId;
  String differenceEn;
  String differenceAr;
  String descAr;
  String descEn;
  String image;
  dynamic isOffer;
  String offerAmount;
  dynamic rate;
  String status;
  String price;
  dynamic lat;
  dynamic lng;
  String createdAt;
  String updatedAt;
  dynamic main_product_id;
  dynamic main_Product_name;
  dynamic desc;
  dynamic Difference;
  dynamic Purchasing_price;
  dynamic Wholesale_wholesale_price;
  dynamic Wholesale_price;
  dynamic Selling_price;
  dynamic barcode;

  static Product_detailBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Product_detailBean product_detailBean = Product_detailBean();
    product_detailBean.id = map['id'];
    product_detailBean.productId = map['product_id'];
    product_detailBean.differenceEn = map['difference_en'];
    product_detailBean.differenceAr = map['difference_ar'];
    product_detailBean.descAr = map['desc_ar'];
    product_detailBean.descEn = map['desc_en'];
    if(map['image'] == null){
      product_detailBean.image = "";
    }
    else{
      product_detailBean.image = map['image'];
    }
    product_detailBean.isOffer = map['is_offer'];
    product_detailBean.offerAmount = map['offer_amount'];
    product_detailBean.rate = map['rate'];
    product_detailBean.status = map['status'];
    product_detailBean.price = map['price'];
    product_detailBean.lat = map['lat'];
    product_detailBean.lng = map['lng'];
    product_detailBean.barcode = map['barcode'];
    product_detailBean.createdAt = map['created_at'];
    product_detailBean.updatedAt = map['updated_at'];
    product_detailBean.main_product_id = map['main_product_id'];
    product_detailBean.main_Product_name = map['main_Product_name'];
    product_detailBean.desc = map['desc'];
    product_detailBean.Difference = map['Difference'];
    product_detailBean.Purchasing_price = map['Purchasing_price'];
    product_detailBean.Wholesale_wholesale_price = map['Wholesale_wholesale_price'];
    product_detailBean.Wholesale_price = map['Wholesale_price'];
    product_detailBean.Selling_price = map['Selling_price'];
    product_detailBean.barcode = map['barcode'];
    return product_detailBean;
  }

  Map toJson() => {
    "id": id,
    "product_id": productId,
    "difference_en": differenceEn,
    "difference_ar": differenceAr,
    "desc_ar": descAr,
    "desc_en": descEn,
    "image": image,
    "is_offer": isOffer,
    "offer_amount": offerAmount,
    "rate": rate,
    "status": status,
    "price": price,
    "lat": lat,
    "lng": lng,
    "barcode": barcode,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "main_product_id": main_product_id,
    "main_Product_name": main_Product_name,
    "desc": desc,
    "Difference": Difference,
    "Purchasing_price": Purchasing_price,
    "Wholesale_wholesale_price": Wholesale_wholesale_price,
    "Wholesale_price": Wholesale_price,
    "Selling_price": Selling_price,
    "barcode": barcode,
  };
}