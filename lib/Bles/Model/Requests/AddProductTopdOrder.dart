class AddProductTopdOrder {
  List<OrdersBean> orders;

  AddProductTopdOrder({this.orders});

  @override
  String toString() {
    return 'AddProductTopdOrder{orders: $orders}';
  }

  static AddProductTopdOrder fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddProductTopdOrder addProductTopdOrderBean = AddProductTopdOrder();
    addProductTopdOrderBean.orders = List()..addAll((map['orders'] as List ?? []).map((o) => OrdersBean.fromMap(o)));
    return addProductTopdOrderBean;
  }

  Map toJson() => {
    "orders": orders,
  };
}

class OrdersBean {
  String productDetailId;
  int quantity;
  String colorId;
  String sizeId;

  OrdersBean({this.productDetailId, this.quantity, this.colorId, this.sizeId});

  static OrdersBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OrdersBean ordersBean = OrdersBean();
    ordersBean.productDetailId = map['product_detail_id'];
    ordersBean.quantity = map['quantity'];
    ordersBean.colorId = map['color_id'];
    ordersBean.sizeId = map['size_id'];
    return ordersBean;
  }

  Map toJson() => {
    "product_detail_id": productDetailId,
    "quantity": quantity,
    "color_id": colorId,
    "size_id": sizeId,
  };
}