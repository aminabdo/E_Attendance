class AddpdOrderRequest {
  String userId;
  String status;
  String paymentMethod;
  String addressId;
  String priceType;
  String shopId;

  static AddpdOrderRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddpdOrderRequest addpdOrderRequestBean = AddpdOrderRequest();
    addpdOrderRequestBean.userId = map['user_id'];
    addpdOrderRequestBean.status = map['status'];
    addpdOrderRequestBean.paymentMethod = map['payment_method'];
    addpdOrderRequestBean.addressId = map['address_id'];
    addpdOrderRequestBean.priceType = map['price_type'];
    addpdOrderRequestBean.shopId = map['shop_id'];
    return addpdOrderRequestBean;
  }

  Map toJson() => {
    "user_id": userId,
    "status": status,
    "payment_method": paymentMethod,
    "address_id": addressId,
    "price_type": priceType,
    "shop_id": shopId,
  };
}