import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/AttendanceBloc.dart';
import 'package:qimma/Bles/Model/Responses/Attendance/MyAttendanceResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';

class MyHistory extends StatefulWidget {
  @override
  _MyHistoryState createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  @override
  void initState() {
    attendanceBloc.getMyHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: Column(
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
                text: "${AppUtils.translate(context, 'my_History_page_title')}",
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: StreamBuilder<MyAttendanceResponse>(
                stream: attendanceBloc.my_attendance.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (attendanceBloc.my_attendance.value.loading) {
                    return Loader();
                  } else {
                    MyAttendanceResponse myAttendance = snapshot.data;
                    return ListView.separated(
                      itemCount: myAttendance.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    myAttendance.data[index].status.toUpperCase() ?? '',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color:
                                        myAttendance.data[index].status ==
                                            'attend'
                                            ? mainColor
                                            : googleColor),
                                  ),
                                  Text(myAttendance.data[index].createdAt),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(myAttendance.data[index].notes ?? ''),

                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1.5,
                          endIndent: 5,
                          indent: 5,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
