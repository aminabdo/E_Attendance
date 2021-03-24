import 'package:qimma/utils/base/BaseResponse.dart';

class EditStatusResponse extends BaseResponse {
  int status;
  String message;
  dynamic data;

  static EditStatusResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    EditStatusResponse editStatusResponse = EditStatusResponse();
    editStatusResponse.status = map['status'];
    editStatusResponse.message = map['message'];
    editStatusResponse.data = map['data'];
    return editStatusResponse;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}