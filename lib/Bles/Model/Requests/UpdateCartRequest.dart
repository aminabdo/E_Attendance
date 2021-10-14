import 'package:E_Attendance/utils/base/BaseRequest.dart';

class UpdateCartRequest extends BaseRequest {
  List<ProductsBean> products;

  static UpdateCartRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UpdateCartRequest updateCartRequestBean = UpdateCartRequest();
    updateCartRequestBean.products = List()..addAll(
      (map['products'] as List ?? []).map((o) => ProductsBean.fromMap(o))
    );
    return updateCartRequestBean;
  }

  Map toJson() => {
    "products": products,
  };
}

class ProductsBean {
  int productDetailId;
  int colorId;
  int sizeId;
  int quantity;

  static ProductsBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ProductsBean productsBean = ProductsBean();
    productsBean.productDetailId = map['product_detail_id'];
    productsBean.colorId = map['color_id'];
    productsBean.sizeId = map['size_id'];
    productsBean.quantity = map['quantity'];
    return productsBean;
  }

  Map toJson() => {
    "product_detail_id": productDetailId,
    "color_id": colorId,
    "size_id": sizeId,
    "quantity": quantity,
  };
}