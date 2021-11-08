import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:E_Attendance/E_Attendance_user/data/model/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_button2.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';


class UsersListPage extends StatefulWidget {
  final dynamic orderId;

  const UsersListPage({Key key, @required this.orderId}) : super(key: key);

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  @override
  void initState() {
    super.initState();
    init();
  }

  init()async{

    await attRepo.getUsers()  ;
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
    double i = size.width;
    return MediaQuery(
      data: new MediaQueryData(),
      child: LoadingOverlay(
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
                          text: 'users_page'.tr,
                        ),
                        StreamBuilder<List<UserData>>(
                          stream: attRepo.users.stream,
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
                                        child: Text("${snapshot.data[index].id}"),
                                        flex: 10,
                                      ),
                                      Expanded(
                                        child: Text("${snapshot.data[index].firstName}"),
                                        flex: 10,
                                      ),
                                      Expanded(
                                        child: Text("${snapshot.data[index].lastName}"),
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
      ),
    );
  }
}