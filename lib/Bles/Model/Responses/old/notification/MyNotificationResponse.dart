import 'package:E_Attendance/utils/base/BaseResponse.dart';

class MyNotificationResponse extends BaseResponse {
  int status;
  List<Notification> data;
  String message;

  static MyNotificationResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MyNotificationResponse myNotificationResponseBean = MyNotificationResponse();
    myNotificationResponseBean.status = map['status'];
    myNotificationResponseBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => Notification.fromMap(o))
    );
    myNotificationResponseBean.message = map['message'];
    return myNotificationResponseBean;
  }

  Map toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}

class Notification {
  int id;
  String name;
  String desc;
  String clickAction;
  String redirectId;
  String status;
  String image;

  static Notification fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Notification dataBean = Notification();
    dataBean.id = map['id'];
    dataBean.name = map['name'];
    dataBean.desc = map['desc'];
    dataBean.clickAction = map['click_action'];
    dataBean.redirectId = map['redirect_id'];
    dataBean.status = map['status'];
    dataBean.image = map['image'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "click_action": clickAction,
    "redirect_id": redirectId,
    "status": status,
    "image": image,
  };
}