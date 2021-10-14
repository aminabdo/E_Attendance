import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';

class Company{
  String id;
  String name;
  String address;
  String lon;
  String lat;
  List<UserData> users;

  Company({this.id, this.name, this.address, this.lon, this.lat, this.users});

  Company.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        lon = json['lon'],
        lat = json['lat'],
        users = json['users'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'lon': lon,
        'lat': lat,
        'users': users,
      };

}
