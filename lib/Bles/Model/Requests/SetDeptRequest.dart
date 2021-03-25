import 'package:qimma/utils/base/BaseRequest.dart';

class SetDeptRequest extends BaseRequest {
  int paid;
  int type;

  SetDeptRequest({this.paid, this.type});

  static SetDeptRequest fromMap(Map<int, dynamic> map) {
    if (map == null) return null;
    SetDeptRequest addAttendance = SetDeptRequest();
    addAttendance.paid = map['paid'];
    addAttendance.type = map['type'];
    return addAttendance;
  }

  Map toJson() => {
    "paid": paid,
    "type": type,
  };
}
