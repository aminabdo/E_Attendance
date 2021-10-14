import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:E_Attendance/Bles/Bloc/AttendanceBloc.dart';
import 'package:E_Attendance/Bles/Model/Requests/AddAttendanceRequest.dart';
import 'package:E_Attendance/E_Attendance_user/home_page.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:E_Attendance/widgets/my_text_form_field.dart';

import 'my_history.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String attendanceStatus;
  TextEditingController _noteController = TextEditingController();
  LocationData _locationData;
  bool pickingLocation = false;
  @override
  void initState() {
    attendanceStatus = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: statusBarHeight + 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  child: MyAppBar(
                    text: "${AppUtils.translate(context, 'attend_and_leave')}",
                    actions: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MyHistory(),
                            ),
                          );
                        },
                        elevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        backgroundColor: secondColor,
                        mini: true,
                        child: Icon(
                          Icons.history,
                          color: Colors.black,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        attendanceStatus =
                            "${AppUtils.translate(context, 'attendance_page_attend')}";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: attendanceStatus == null
                              ? Colors.white
                              : attendanceStatus ==
                                      "${AppUtils.translate(context, 'attendance_page_attend')}"
                                  ? mainColor
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: attendanceStatus == null
                                ? mainColor
                                : attendanceStatus ==
                                        "${AppUtils.translate(context, 'attendance_page_attend')}"
                                    ? Colors.white
                                    : mainColor,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Text(
                          "${AppUtils.translate(context, 'attendance_page_attend')}",
                          style: TextStyle(
                              color: attendanceStatus == null
                                  ? mainColor
                                  : attendanceStatus ==
                                          "${AppUtils.translate(context, 'attendance_page_attend')}"
                                      ? Colors.white
                                      : mainColor),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        attendanceStatus =
                            "${AppUtils.translate(context, 'attendance_page_leave')}";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: attendanceStatus == null
                              ? Colors.white
                              : attendanceStatus ==
                                      "${AppUtils.translate(context, 'attendance_page_leave')}"
                                  ? mainColor
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: attendanceStatus == null
                                ? mainColor
                                : attendanceStatus ==
                                        "${AppUtils.translate(context, 'attendance_page_leave')}"
                                    ? Colors.white
                                    : mainColor,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Text(
                          "${AppUtils.translate(context, 'attendance_page_leave')}",
                          style: TextStyle(
                              color: attendanceStatus == null
                                  ? mainColor
                                  : attendanceStatus ==
                                          "${AppUtils.translate(context, 'attendance_page_leave')}"
                                      ? Colors.white
                                      : mainColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MyTextFormField(
                  controller: _noteController,
                  maxLines: 4,
                  label:
                      "${AppUtils.translate(context, 'attendance_page_note')}",
                ),
              ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () async {
                  _locationData == null;

                  if (attendanceStatus == null) {
                    AppUtils.showToast(
                        msg:
                            '${AppUtils.showToast(msg: 'attendance_page_msg')}',
                        bgColor: mainColor);
                  } else {
                    setState(() {
                      pickingLocation = true;
                    });

                    var locationPermissionGranted =
                        await AppUtils.askLocationPermission();
                    if (locationPermissionGranted) {
                      Location location = new Location();

                      bool _serviceEnabled;
                      PermissionStatus _permissionGranted;

                      _serviceEnabled = await location.serviceEnabled();
                      if (!_serviceEnabled) {
                        _serviceEnabled = await location.requestService();
                        if (!_serviceEnabled) {
                          AppUtils.showToast(
                              msg: AppUtils.translate(context, 'open_gps'));
                          setState(() {
                            pickingLocation = false;
                          });
                          return;
                        }
                      }

                      _permissionGranted = await location.hasPermission();
                      if (_permissionGranted == PermissionStatus.DENIED) {
                        _permissionGranted = await location.requestPermission();
                        if (_permissionGranted != PermissionStatus.GRANTED) {
                          AppUtils.showToast(
                              msg: AppUtils.translate(
                                  context, 'permission_denied'));
                          setState(() {
                            pickingLocation = false;
                          });
                          return;
                        }
                      }

                      _locationData = await location.getLocation();
                      setState(() {
                        pickingLocation = false;
                      });
                    }
                    attendanceBloc.addAttendance(AttendanceRequest(
                        status: attendanceStatus ==
                                "${AppUtils.translate(context, 'attendance_page_attend')}"
                            ? 1
                            : 2,
                        note: _noteController.text,
                        lon: "${_locationData.longitude.toString()}",
                        lat: "${_locationData.latitude.toString()}"));
                    _noteController.text = "";
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Text(
                      "${AppUtils.translate(context, 'attendance_page_register')}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
