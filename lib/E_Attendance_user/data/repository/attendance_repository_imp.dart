import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:rxdart/rxdart.dart';

class AttendanceRepositoryImp {
  BehaviorSubject<List<String>> _attendance = BehaviorSubject<List<String>>();
  Future checkin({UserData user}) async {
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    user.dateTime = DateTime.now();

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
    user.dateTime = DateTime.now();
    database
        .reference()
        .child('attendance')
        .child(
            "2_${user.id}_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}")
        .set(user.toJson());
    database
        .reference()
        .child('users')
        .child("${user.phone}")
        .set(user.toJson());
  }

  Future<dynamic> getAttendanceData() async {
    List<UserData> attendance;

    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = await FirebaseDatabase(app: app);
    await database
        .reference()
        .child('attendance')
        .limitToLast(1000)
        .onChildAdded
        .forEach((element) {
      var line = element.snapshot.key;
      log(" ->>> ${line}");
    });

  }
}
class Attendance{
  String checkin;
  String checkout;
  String date;

  Attendance(this.checkin, this.checkout, this.date);

  Attendance.fromJson(Map<String, dynamic> json)
      : checkin = json['checkin'],
        checkout = json['checkout'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'checkin': checkin,
        'checkout': checkout,
        'date': date,
      };
}
