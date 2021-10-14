import 'package:E_Attendance/utils/base/BaseRequest.dart';

class AddAddressRequest extends BaseRequest {
  String lat;
  String lng;
  String address;

  AddAddressRequest({this.lat, this.lng, this.address});

  static AddAddressRequest fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    AddAddressRequest addAddressRequestBean = AddAddressRequest();
    addAddressRequestBean.lat = map['lat'];
    addAddressRequestBean.lng = map['lng'];
    addAddressRequestBean.address = map['address'];
    return addAddressRequestBean;
  }

  Map toJson() => {
    "lat": lat,
    "lng": lng,
    "address": address,
  };
}