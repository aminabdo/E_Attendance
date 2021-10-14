import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:E_Attendance/Bles/Bloc/client_bloc.dart';
import 'package:E_Attendance/pages/client/set_dept_page.dart';
import 'client_info_page.dart';
import 'package:E_Attendance/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:E_Attendance/Bles/Model/Responses/client/ClientOfRepresentativeResponse.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:E_Attendance/widgets/my_app_bar.dart';
import 'package:E_Attendance/widgets/my_loader.dart';

class ClientsOfRepresentativePage extends StatefulWidget {
  @override
  _ClientsOfRepresentativePageState createState() =>
      _ClientsOfRepresentativePageState();
}

class _ClientsOfRepresentativePageState
    extends State<ClientsOfRepresentativePage> {
  @override
  void initState() {
    super.initState();

    clientBloc.getClientsOfRepresentative();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ClientInfoPage(),
              ),
            );
          },
          label: Text(
              '${AppUtils.translate(context, 'all_clients_of_representative_page_add_client')}')),
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
                  text:
                      "${AppUtils.translate(context, 'all_clients_of_representative_page_title')}",
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Flexible(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: StreamBuilder<ClientOfRepresentativeResponse>(
                stream: clientBloc.all_clients_of_representative.stream,
                builder: (context, AsyncSnapshot<ClientOfRepresentativeResponse> snapshot) {
                  if (clientBloc.all_clients_of_representative.value.loading) {
                    return Loader();
                  } else {
                    ClientOfRepresentativeResponse client = snapshot.data;
                    return ListView.separated(
                      itemCount: client.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(right: 10, left: 10 , bottom: 10 ,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(client.data[index].firstName +
                                          ' ' +
                                          client.data[index].lastName ??
                                      ''),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Text(client.data[index].id.toString() ?? ''),
                                  Text(client.data[index].debt.toString() ?? '')
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                 /* IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: googleColor,
                                      ),
                                      onPressed: () {
                                        clientBloc
                                            .deleteClient(
                                                clientId: client.data[index].id.toString())
                                            .then((value) {
                                          AppUtils.showToast(
                                              msg: value.message,
                                              bgColor: mainColor);
                                        });
                                      }),*/
                                  IconButton(
                                    icon: Icon(
                                      Icons.money,
                                      color: mainColor,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => SetDeptPage(clientId: snapshot.data.data[index].id,),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              )
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
