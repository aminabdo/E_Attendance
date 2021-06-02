import 'package:qimma/utils/base/BaseRequest.dart';

class AttendanceRequest extends BaseRequest {
  int status;
  String note;
  String lon;
  String lat;

  AttendanceRequest({this.status, this.note , this.lon , this.lat});

  static AttendanceRequest fromMap(Map<int, dynamic> map) {
    if (map == null) return null;
    AttendanceRequest addAttendance = AttendanceRequest();
    addAttendance.status = map['status'];
    addAttendance.note = map['note'];
    return addAttendance;
  }

  Map toJson() => {
        "status": status,
        "note": note,
        "lng": lon,
        "lat": lat,
      };
}
