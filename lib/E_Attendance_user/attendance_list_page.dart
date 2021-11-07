import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button2.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import 'data/model/attendance.dart';


class AttendanceListPage extends StatefulWidget {
  final dynamic userID;

  const AttendanceListPage({Key key, @required this.userID}) : super(key: key);

  @override
  _AttendanceListPageState createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {

  String startDate = "start date";
  String endDate = "end date";
  DateTime start, end ;


  @override
  void initState() {
    super.initState();
    init();
  }

  init()async{

    await attRepo.getAttendanceData(start: start, end: end);
    setState(() {

    });
  }
  bool isLoading = false;

  Widget space(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: false,
      progressIndicator: Loader(),
      color: mat.Colors.white,
      opacity: .5,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(18.0),
          child: MyButton2(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'next'.tr,
                  style: TextStyle(color: mat.Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('TEST1',
                  style: TextStyle(color: mat.Colors.white),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                color: mat.Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      space(context),
                      MyAppBar(
                        text: 'attendance_page'.tr,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(2020, 3, 5),
                                          maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                                            print('change $date');

                                          }, onConfirm: (date) async {
                                            startDate = "${date.year}/${date.month}/${date.day}";
                                            setState(() {

                                            });
                                            start = date;
                                            await attRepo.getAttendanceData(start: start, end: end);

                                            setState(() {

                                            });
                                            print('confirm $date');
                                          }, currentTime: DateTime.now(), locale: LocaleType.ar);
                                    },
                                    child: Text(
                                      '${startDate}',
                                    )),
                            ),
                            Expanded(
                                child: TextButton(
                                    onPressed: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(2020, 3, 5),
                                          maxTime: DateTime(2025, 6, 7), onChanged: (date) {

                                          }, onConfirm: (date) async {
                                            print('change $date');
                                            endDate = "${date.year}/${date.month}/${date.day}";
                                            setState(() {

                                            });
                                            end = date;
                                            await attRepo.getAttendanceData(start: start, end: end);
                                            setState(() {

                                            });
                                            print('confirm $date');
                                          }, currentTime: DateTime.now(), locale: LocaleType.ar);
                                    },
                                    child: Text(
                                      '${endDate}',
                                    )),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<AttendanceModel>>(
                        stream: attRepo.attendance.stream,
                        builder: (context, snapshot) {
                          print("->->-> ${snapshot.data}");
                            return ListView.separated(
                              //change this too
                                separatorBuilder: (BuildContext context, int index) => const Divider(),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: snapshot?.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text("${snapshot.data[index].date}"),
                                        flex: 10,
                                      ),
                                      Expanded(
                                        child: Text("${snapshot.data[index].attendDate}"),
                                        flex: 10,
                                      ),
                                      Expanded(
                                        child: Text("${snapshot.data[index].leaveDate}"),
                                        flex: 10,
                                      ),
                                    ],
                                  );
                                });
                        },
                      ),
                    ],
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