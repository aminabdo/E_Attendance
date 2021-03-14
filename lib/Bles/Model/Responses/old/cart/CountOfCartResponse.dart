import 'package:qimma/utils/base/BaseResponse.dart';

class CountOfCartResponse extends BaseResponse {
  int status;
  DataBean data;
  String message;

  static CountOfCartResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    CountOfCartResponse countOfCartResponseBean = CountOfCartResponse();
    countOfCartResponseBean.status = map['status'];
    countOfCartResponseBean.data = DataBean.fromMap(map['data']);
    countOfCartResponseBean.message = map['message'];
    return countOfCartResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class DataBean {
  int cartCount;
  int countWishlist;
  int notfctionCount;
  int messageCount;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.cartCount = map['cart_count'];
    dataBean.countWishlist = map['count_wishlist'];
    dataBean.notfctionCount = map['notfction_count'];
    dataBean.messageCount = map['message_count'];
    return dataBean;
  }

  Map toJson() => {
    "cart_count": cartCount,
    "count_wishlist": countWishlist,
    "notfction_count": notfctionCount,
    "message_count": messageCount,
  };
}