import 'package:qimma/utils/base/BaseRequest.dart';

class AddClientToRepresentativeRequest extends BaseRequest {
  int userId;


  AddClientToRepresentativeRequest({this.userId});

  static AddClientToRepresentativeRequest fromMap(Map<int, dynamic> map) {
    if (map == null) return null;
    AddClientToRepresentativeRequest addClientToRepresentative = AddClientToRepresentativeRequest();
    addClientToRepresentative.userId = map['user_id'];
    return addClientToRepresentative;
  }

  Map toJson() => {
    "user_id": userId,
  };
}