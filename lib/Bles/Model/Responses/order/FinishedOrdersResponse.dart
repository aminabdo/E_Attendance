import 'package:qimma/utils/base/BaseResponse.dart';

class FinishedOrdersResponse extends BaseResponse{
  int status;
  List<DataBean> data;
  String message;

  static FinishedOrdersResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FinishedOrdersResponse finishedOrdersResponse = FinishedOrdersResponse();
    finishedOrdersResponse.status = map['status'];
    finishedOrdersResponse.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    finishedOrdersResponse.message = map['message'];
    return finishedOrdersResponse;
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
  int discount;
  int tax1;
  int tax2;
  int totalPrice;
  int paid;
  int rest;
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
  dynamic colorId;
  dynamic sizeId;
  dynamic color;
  dynamic size;

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
    productsBean.color = map['color'];
    productsBean.size = map['size'];
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

class Product_detailBean {
  int id;
  String mainProductId;
  String mainProductName;
  String desc;
  String Difference;
  String image;
  int rate;
  int isOffer;
  String offerAmount;
  double lat;
  double lng;
  String distance;
  bool isFavorite;
  int InventoryId;
  String InventoryName;
  int Quantity;
  List<dynamic> colors;
  List<dynamic> sizes;
  List<dynamic> images;
  String PurchasingPrice;
  String WholesaleWholesalePrice;
  String WholesalePrice;
  String SellingPrice;
  String barcode;

  static Product_detailBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Product_detailBean product_detailBean = Product_detailBean();
    product_detailBean.id = map['id'];
    product_detailBean.mainProductId = map['main_product_id'];
    product_detailBean.mainProductName = map['main_Product_name'];
    product_detailBean.desc = map['desc'];
    product_detailBean.Difference = map['Difference'];
    product_detailBean.image = map['image'];
    product_detailBean.rate = map['rate'];
    product_detailBean.isOffer = map['is_offer'];
    product_detailBean.offerAmount = map['offer_amount'];
    product_detailBean.lat = map['lat'];
    product_detailBean.lng = map['lng'];
    product_detailBean.distance = map['distance'];
    product_detailBean.isFavorite = map['is_favorite'];
    product_detailBean.InventoryId = map['Inventory_id'];
    product_detailBean.InventoryName = map['Inventory_name'];
    product_detailBean.Quantity = map['Quantity'];
    product_detailBean.colors = map['colors'];
    product_detailBean.sizes = map['sizes'];
    product_detailBean.images = map['images'];
    product_detailBean.PurchasingPrice = map['Purchasing_price'];
    product_detailBean.WholesaleWholesalePrice = map['Wholesale_wholesale_price'];
    product_detailBean.WholesalePrice = map['Wholesale_price'];
    product_detailBean.SellingPrice = map['Selling_price'];
    product_detailBean.barcode = map['barcode'];
    return product_detailBean;
  }

  Map toJson() => {
    "id": id,
    "main_product_id": mainProductId,
    "main_Product_name": mainProductName,
    "desc": desc,
    "Difference": Difference,
    "image": image,
    "rate": rate,
    "is_offer": isOffer,
    "offer_amount": offerAmount,
    "lat": lat,
    "lng": lng,
    "distance": distance,
    "is_favorite": isFavorite,
    "Inventory_id": InventoryId,
    "Inventory_name": InventoryName,
    "Quantity": Quantity,
    "colors": colors,
    "sizes": sizes,
    "images": images,
    "Purchasing_price": PurchasingPrice,
    "Wholesale_wholesale_price": WholesaleWholesalePrice,
    "Wholesale_price": WholesalePrice,
    "Selling_price": SellingPrice,
    "barcode": barcode,
  };
}