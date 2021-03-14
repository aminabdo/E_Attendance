import 'package:qimma/utils/base/BaseResponse.dart';

class FilterWebSiteResponse extends BaseResponse{
  DataBean data;
  int status;
  String message;

  static FilterWebSiteResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    FilterWebSiteResponse filterWebSiteResponseBean = FilterWebSiteResponse();
    filterWebSiteResponseBean.data = DataBean.fromMap(map['data']);
    filterWebSiteResponseBean.status = map['status'];
    filterWebSiteResponseBean.message = map['message'];
    return filterWebSiteResponseBean;
  }

  Map toJson() => {
    "data": data,
    "status": status,
    "message": message,
  };
}

class DataBean {
  List<ProductsBean> Offers;
  List<ProductsBean> products;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.Offers = List()..addAll(
      (map['Offers'] as List ?? []).map((o) => ProductsBean.fromMap(o))
    );
    dataBean.products = List()..addAll(
      (map['products'] as List ?? []).map((o) => ProductsBean.fromMap(o))
    );
    return dataBean;
  }

  Map toJson() => {
    "Offers": Offers,
    "products": products,
  };
}

class ProductsBean {
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

  static ProductsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProductsBean productsBean = ProductsBean();
    productsBean.id = map['id'];
    productsBean.mainProductId = map['main_product_id'];
    productsBean.mainProductName = map['main_Product_name'];
    productsBean.desc = map['desc'];
    productsBean.Difference = map['Difference'];
    productsBean.image = map['image'];
    productsBean.rate = map['rate'];
    productsBean.isOffer = map['is_offer'];
    productsBean.offerAmount = map['offer_amount'];
    productsBean.lat = map['lat'];
    productsBean.lng = map['lng'];
    productsBean.distance = map['distance'];
    productsBean.isFavorite = map['is_favorite'];
    productsBean.InventoryId = map['Inventory_id'];
    productsBean.InventoryName = map['Inventory_name'];
    productsBean.Quantity = map['Quantity'];
    productsBean.colors = List()..addAll(
      (map['colors'] as List ?? []).map((o) => ColorsBean.fromMap(o))
    );
    productsBean.sizes = List()..addAll(
      (map['sizes'] as List ?? []).map((o) => SizesBean.fromMap(o))
    );
    productsBean.images = List()..addAll(
      (map['images'] as List ?? []).map((o) => ImagesBean.fromMap(o))
    );
    productsBean.PurchasingPrice = map['Purchasing_price'];
    productsBean.WholesaleWholesalePrice = map['Wholesale_wholesale_price'];
    productsBean.WholesalePrice = map['Wholesale_price'];
    productsBean.SellingPrice = map['Selling_price'];
    productsBean.barcode = map['barcode'];
    return productsBean;
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

