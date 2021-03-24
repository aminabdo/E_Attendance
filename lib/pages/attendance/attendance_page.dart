import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/AttendanceBloc.dart';
import 'package:qimma/Bles/Model/Requests/AddAttendanceRequest.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_text_form_field.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String attendanceStatus;
  TextEditingController _noteController = TextEditingController();

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
                onTap: () {
                  if (attendanceStatus == null) {
                    AppUtils.showToast(
                        msg:
                            '${AppUtils.showToast(msg: 'attendance_page_msg')}',
                        bgColor: mainColor);
                  } else {
                    attendanceBloc
                        .addAttendance(AddAttendanceRequest(
                            status: attendanceStatus ==
                                    "${AppUtils.translate(context, 'attendance_page_attend')}"
                                ? 1
                                : 2,
                            note: _noteController.text))
                        .then((value) {
                      AppUtils.showToast(
                          msg: value.message, bgColor: mainColor);
                    });
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
