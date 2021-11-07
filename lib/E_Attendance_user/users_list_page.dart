import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:E_Attendance/pages/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_loader.dart';
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

    await attRepo.getUsers();
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

        body: Stack(
          children: [
            SingleChildScrollView(
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
                          StreamBuilder<List<UserData>>(
                            stream: attRepo.users.stream,
                            builder: (context, snapshot) {
                              return ListView.separated(
                                //change this too
                                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: snapshot?.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){

                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text("${snapshot.data[index].firstName}"),
                                            flex: 10,
                                          ),
                                          Expanded(
                                            child: Text("${snapshot.data[index].lastName}"),
                                            flex: 10,
                                          ),
                                          Expanded(
                                            child: Text("${snapshot.data[index].phone}"),
                                            flex: 10,
                                          ),
                                        ],
                                      ),
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
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SingupPage(),
                    ),
                  );
                },
                child: Text("add".tr),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}