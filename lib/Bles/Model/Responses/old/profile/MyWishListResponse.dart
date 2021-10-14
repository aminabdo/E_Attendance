import 'package:E_Attendance/utils/base/BaseResponse.dart';

class MyWishListResponse extends BaseResponse{
  int status;
  List<DataBean> data;
  String message;

  static MyWishListResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MyWishListResponse myWishListResponseBean = MyWishListResponse();
    myWishListResponseBean.status = map['status'];
    myWishListResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    myWishListResponseBean.message = map['message'];
    return myWishListResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
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
  String Quantity;
  List<ColorsBean> colors;
  List<SizesBean> sizes;
  List<ImagesBean> images;
  String PurchasingPrice;
  String WholesaleWholesalePrice;
  String WholesalePrice;
  String SellingPrice;
  String barcode;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.mainProductId = map['main_product_id'];
    dataBean.mainProductName = map['main_Product_name'];
    dataBean.desc = map['desc'];
    dataBean.Difference = map['Difference'];
    dataBean.image = map['image'];
    dataBean.rate = map['rate'];
    dataBean.isOffer = map['is_offer'];
    dataBean.offerAmount = map['offer_amount'];
    dataBean.lat = map['lat'];
    dataBean.lng = map['lng'];
    dataBean.distance = map['distance'];
    dataBean.isFavorite = map['is_favorite'];
    dataBean.InventoryId = map['Inventory_id'];
    dataBean.InventoryName = map['Inventory_name'];
    dataBean.Quantity = map['Quantity'];
    dataBean.colors = List()..addAll(
      (map['colors'] as List ?? []).map((o) => ColorsBean.fromMap(o))
    );
    dataBean.sizes = List()..addAll(
      (map['sizes'] as List ?? []).map((o) => SizesBean.fromMap(o))
    );
    dataBean.images = List()..addAll(
      (map['images'] as List ?? []).map((o) => ImagesBean.fromMap(o))
    );
    dataBean.PurchasingPrice = map['Purchasing_price'];
    dataBean.WholesaleWholesalePrice = map['Wholesale_wholesale_price'];
    dataBean.WholesalePrice = map['Wholesale_price'];
    dataBean.SellingPrice = map['Selling_price'];
    dataBean.barcode = map['barcode'];
    return dataBean;
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

class ImagesBean {
  int id;
  String image;

  static ImagesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ImagesBean imagesBean = ImagesBean();
    imagesBean.id = map['id'];
    imagesBean.image = map['image'];
    return imagesBean;
  }

  Map toJson() => {
    "id": id,
    "image": image,
  };
}

class SizesBean {
  int id;
  String name;

  static SizesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SizesBean sizesBean = SizesBean();
    sizesBean.id = map['id'];
    sizesBean.name = map['name'];
    return sizesBean;
  }

  Map toJson() => {
    "id": id,
    "name": name,
  };
}

class ColorsBean {
  int id;
  String colorCode;

  static ColorsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ColorsBean colorsBean = ColorsBean();
    colorsBean.id = map['id'];
    colorsBean.colorCode = map['color_code'];
    return colorsBean;
  }

  Map toJson() => {
    "id": id,
    "color_code": colorCode,
  };
}