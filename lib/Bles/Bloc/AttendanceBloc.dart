import 'dart:async';
import 'package:qimma/Bles/Model/Requests/AddAttendanceRequest.dart';
import 'package:qimma/Bles/Model/Responses/Attendance/AddAttendanceResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';
import '../ApiRoute.dart';

class AttendanceBloc extends BaseBloc {
  BehaviorSubject<AddAttendanceResponse> _add_attendance =
      BehaviorSubject<AddAttendanceResponse>();

  Future<AddAttendanceResponse> addAttendance(
      AddAttendanceRequest request) async {
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

  BehaviorSubject<AddAttendanceResponse> get add_attendance => _add_attendance;
}

final attendanceBloc = AttendanceBloc();
