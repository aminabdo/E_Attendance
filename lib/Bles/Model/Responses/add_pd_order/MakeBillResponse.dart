import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/base/BaseResponse.dart';

class MakeBillResponse  extends BaseResponse{
  int status;
  DataBean data;
  String message;

  static MakeBillResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MakeBillResponse makeBillResponseBean = MakeBillResponse();
    makeBillResponseBean.status = map['status'];
    makeBillResponseBean.data = DataBean.fromMap(map['data']);
    makeBillResponseBean.message = map['message'];
    return makeBillResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int id;
  String priceType;
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
  String lat;
  String lng;
  String address;
  List<ProductsBean> products;
  String createdAt;
  String updatedAt;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
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
  dynamic quantity;
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
  String barcode;
  String createdAt;
  String updatedAt;

  static Product_detailBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Product_detailBean product_detailBean = Product_detailBean();
    product_detailBean.id = map['id'];
    product_detailBean.productId = map['product_id'];
    product_detailBean.differenceEn = map['difference_en'];
    product_detailBean.differenceAr = map['difference_ar'];
    product_detailBean.descAr = map['desc_ar'];
    product_detailBean.descEn = map['desc_en'];
    product_detailBean.image = map['image'];
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

    if(AppUtils.language == "ar"){
      product_detailBean.differenceEn = product_detailBean.differenceAr;
      product_detailBean.descEn = product_detailBean.descAr;
    }
    print("lang ------>>>> ${AppUtils.language}");
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
  };
}