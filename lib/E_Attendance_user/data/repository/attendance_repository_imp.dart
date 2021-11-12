import 'dart:convert';
import 'dart:developer';

import 'package:E_Attendance/E_Attendance_user/data/model/attendance.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';
import 'package:date_utils/date_utils.dart' as d1;


class AttendanceRepositoryImp {
  BehaviorSubject<List<AttendanceModel>> _attendance = BehaviorSubject<List<AttendanceModel>>();
  BehaviorSubject<List<AttendanceModel>> get attendance => _attendance;

  BehaviorSubject<List<UserData>> _users = BehaviorSubject<List<UserData>>();
  BehaviorSubject<List<UserData>> get users => _users;

  BehaviorSubject<LocationData> _locations = BehaviorSubject<LocationData>();
  BehaviorSubject<LocationData> get locations => _locations;

  Future checkin({UserData user}) async {
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    user.time = DateTime.now().toString();

    // for single attendance
    database
        .reference()
        .child('attendance')
        .child(
            "1_${user.id}_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}")
        .set(user.toJson());


    // for multi attendance
    //database.reference().child('attendance').push().set(user.toJson());

    // add user
    database
        .reference()
        .child('users')
        .child("${user.phone}_${user.password}")
        .set(user.toJson());
  }

  Future checkout({UserData user}) async {
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    user.time = DateTime.now().toString();
    database
        .reference()
        .child('attendance')
        .child(
            "2_${user.id}_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}")
        .set(user.toJson());
    database
        .reference()
        .child('users')
        .child("${user.phone}_${user.password}")
        .set(user.toJson());
  }

  Future<List<AttendanceModel>> getAttendanceData({DateTime start, DateTime end,}) async {
    List<AttendanceModel> att = [];
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = await FirebaseDatabase(app: app);
    await database
        .reference()
        .child('attendance')
        .limitToLast(1000)
        .onChildAdded
        .forEach((element) {
      var line = element.snapshot.key;
      var value = element.snapshot.value;
      String checkin = "${line.split("_")[2]}";
      String year = "${line.split("_")[2]}";
      String month = "${line.split("_")[3]}";
      String day = "${line.split("_")[4]}";
      DateTime dateTime = DateTime(int.parse(year), int.parse(month), int.parse(day));

      String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
      log("${date}");

      String day1 = d1.DateUtils.formatDay(dateTime);
      String dayName = d1.DateUtils.formatDay(dateTime);
      log("-----000---> ${d1.DateUtils.formatDay(dateTime)}");

      if(start == null || end == null ){
        att.add(AttendanceModel(DateFormat("dd-MM-yyyy").format(dateTime), value['time'] ??'', value['time'] ??'', day1));
      }
      if(dateTime?.isAfter(start?? DateTime.now()) && dateTime?.isBefore(end ?? DateTime.now())){
        att.add(AttendanceModel(DateFormat("dd-MM-yyyy").format(dateTime), value['time'] ??'', value['time'] ??'', day1));
      }



      _attendance.sink.add(att);
      _attendance.value = att;
      log(" ->>> ${line}");
    });
    return att;
  }

  Future<List<UserData>> getUsers() async{
    List<UserData> users_ = [];
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    await database
        .reference()
        .child('users')
        .limitToLast(1000)
        .onChildAdded
        .forEach((element) {
      var line = element.snapshot.key;
      var value = element.snapshot.value;

      users_.add(UserData.fromMap(json.decode(json.encode(value))));
      _users.sink.add(users_);
      _users.value = users_;
      log(" ->>> ${line}");
    });
    return users_;
  }
  Future<LocationData> getLocation() async{
    LocationData location = null;
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    await database
        .reference()
        .child('location')
        .limitToLast(1000)
        .onChildAdded
        .forEach((element) {
      var line = element.snapshot.key;
      var value = element.snapshot.value;

      location = LocationData.fromMap({"latitude":value['latitude'],"longitude":value['longitude']});
      _locations.sink.add(location);
      _locations.value = location;
      log(" ->>> ${line}");
    });
    return location;
  }

  Future saveLocation({double latitude, double longitude}) async {
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    bool pickingLocation = true;

    LocationData locationData;
    var locationPermissionGranted = await AppUtils.askLocationPermission();
    if (locationPermissionGranted) {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          AppUtils.showToast(msg: 'open_gps'.tr);

          pickingLocation = false;

          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.DENIED) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.GRANTED) {
          AppUtils.showToast(msg: 'permission_denied'.tr);

          pickingLocation = false;

          return;
        }
      }

      LocationData locationData = await location.getLocation();
      database
          .reference()
          .child('location')
          .child(
          "1")
          .set({"latitude":locationData.latitude, "longitude":locationData.longitude});
    }




  }
}
var attRepo = AttendanceRepositoryImp();