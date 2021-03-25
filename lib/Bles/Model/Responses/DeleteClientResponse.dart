import 'package:qimma/utils/base/BaseResponse.dart';

class DeleteClientResponse extends BaseResponse {
  int status;
  String message;
  dynamic data;

  static DeleteClientResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    DeleteClientResponse deleteClientResponseBean = DeleteClientResponse();
    deleteClientResponseBean.status = map['status'];
    deleteClientResponseBean.message = map['message'];
    deleteClientResponseBean.data = map['data'];
    return deleteClientResponseBean;
  }

  Map toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}