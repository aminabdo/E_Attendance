class AddToCartRequest {
  String productId;
  String quantity;
  String colorId;
  String sizeId;


  AddToCartRequest({this.productId, this.quantity, this.colorId, this.sizeId});

  static AddToCartRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddToCartRequest addToCartRequestBean = AddToCartRequest();
    addToCartRequestBean.productId = map['product_id'];
    addToCartRequestBean.quantity = map['quantity'];
    addToCartRequestBean.colorId = map['color_id'];
    addToCartRequestBean.sizeId = map['size_id'];
    return addToCartRequestBean;
  }

  Map toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "color_id": colorId,
    "size_id": sizeId,
  };
}