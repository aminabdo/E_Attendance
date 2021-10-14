import 'package:E_Attendance/utils/base/BaseRequest.dart';

class EditStatusRequest extends BaseRequest {
  int status;


  EditStatusRequest({this.status});

  static EditStatusRequest fromMap(Map<int, dynamic> map) {
    if (map == null) return null;
    EditStatusRequest editStatus = EditStatusRequest();
    editStatus.status = map['status'];
    return editStatus;
  }

  Map toJson() => {
    "status": status,
  };
}