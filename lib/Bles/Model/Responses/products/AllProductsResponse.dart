import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:qimma/utils/base/BaseResponse.dart';



class AllProductsResponse extends BaseResponse {
  int status;
  List<DataBean> data;
  String message;


  AllProductsResponse(){
    data = List<DataBean>();
  }

  static AllProductsResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AllProductsResponse allProducts = AllProductsResponse();
    allProducts.status = map['status'];
    allProducts.data = List()
      ..addAll((map['data'] as List ?? []).map((o) => DataBean.fromMap(o)));
    allProducts.message = map['message'];
    return allProducts;
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
  dynamic rate;
  int isOffer;
  String offerAmount;
  dynamic lat;
  dynamic lng;
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
    dataBean.colors = map['colors'];
    dataBean.sizes = map['sizes'];
    dataBean.images = map['images'];
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
