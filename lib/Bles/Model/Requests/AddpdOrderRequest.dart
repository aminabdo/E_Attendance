import 'package:flutter/foundation.dart';

class AddOrderRequest {
  String userId;
  String status;
  String paymentMethod;
  String addressId;
  String priceType; // 1 || 2 || 3
  String shopId;


  AddOrderRequest(
      {@required this.userId,
      this.status = '1',
      this.paymentMethod = '1',
      @required this.addressId,
      @required this.priceType,
      this.shopId = '10',
      });

  @override
  String toString() {
    return 'AddOrderRequest{userId: $userId, status: $status, paymentMethod: $paymentMethod, addressId: $addressId, priceType: $priceType, shopId: $shopId}';
  }

  static AddOrderRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddOrderRequest addpdOrderRequestBean = AddOrderRequest();
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