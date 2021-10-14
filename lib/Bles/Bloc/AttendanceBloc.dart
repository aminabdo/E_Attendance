import 'dart:async';
import 'package:E_Attendance/Bles/Model/Requests/AddAttendanceRequest.dart';
import 'package:E_Attendance/Bles/Model/Responses/Attendance/AddAttendanceResponse.dart';
import 'package:E_Attendance/Bles/Model/Responses/Attendance/MyAttendanceResponse.dart';
import 'package:E_Attendance/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';
import '../ApiRoute.dart';

class AttendanceBloc extends BaseBloc {
  BehaviorSubject<AddAttendanceResponse> _add_attendance =
      BehaviorSubject<AddAttendanceResponse>();
  BehaviorSubject<MyAttendanceResponse> _my_attendance =
  BehaviorSubject<MyAttendanceResponse>();

  Future<AddAttendanceResponse> addAttendance(
      AttendanceRequest request) async {
    _add_attendance.value = AddAttendanceResponse();
    _add_attendance.value.loading = true;
    AddAttendanceResponse response = AddAttendanceResponse.fromMap(
        (await repository.post(
                ApiRoutes.addAttendance(), request.toJson()))
            .data);
    _add_attendance.value = response;
    _add_attendance.value.loading = false;
    return response;
  }

  Future<MyAttendanceResponse> getMyHistory() async {
    _my_attendance.value = MyAttendanceResponse();
    _my_attendance.value.loading = true;
    MyAttendanceResponse response = MyAttendanceResponse.fromMap(
        (await repository.get(
            ApiRoutes.myAttendance()))
            .data);
    _my_attendance.value = response;
    _my_attendance.value.loading = false;
    return response;
  }

  BehaviorSubject<AddAttendanceResponse> get add_attendance => _add_attendance;
  BehaviorSubject<MyAttendanceResponse> get my_attendance => _my_attendance;
}

final attendanceBloc = AttendanceBloc();
