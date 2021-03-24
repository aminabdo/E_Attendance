import 'package:qimma/utils/base/BaseRequest.dart';

class AddAttendanceRequest extends BaseRequest {
  int status;
  String note;

  AddAttendanceRequest({this.status, this.note});

  static AddAttendanceRequest fromMap(Map<int, dynamic> map) {
    if (map == null) return null;
    AddAttendanceRequest addAttendance = AddAttendanceRequest();
    addAttendance.status = map['status'];
    addAttendance.note = map['note'];
    return addAttendance;
  }

  Map toJson() => {
        "status": status,
        "note": note,
      };
}
