import 'package:E_Attendance/utils/base/BaseResponse.dart';

class GetMainCatResponse extends BaseResponse{
  List<DataBean> data;
  int status;
  String message;

  static GetMainCatResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    GetMainCatResponse getMainCatBean = GetMainCatResponse();
    getMainCatBean.data = List()..addAll(
      (map['data'] as List ?? []).map((o) => DataBean.fromMap(o))
    );
    getMainCatBean.status = map['status'];
    getMainCatBean.message = map['message'];
    return getMainCatBean;
  }

  Map toJson() => {
    "data": data,
    "status": status,
    "message": message,
  };
}

class DataBean {
  int id;
  String name;
  dynamic desc;
  String image;

  static DataBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DataBean dataBean = DataBean();
    dataBean.id = map['id'];
    dataBean.name = map['name'];
    dataBean.desc = map['desc'];
    dataBean.image = map['image'];
    return dataBean;
  }

  Map toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "image": image,
  };
}