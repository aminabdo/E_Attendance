import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/client_bloc.dart';
import 'package:qimma/Bles/Model/Requests/AddClientToRepresentativeRequest.dart';
import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_loader.dart';

class ClientInfoPage extends StatefulWidget {
  @override
  _ClientInfoPageState createState() => _ClientInfoPageState();
}

class _ClientInfoPageState extends State<ClientInfoPage> {
  @override
  void initState() {
    super.initState();
    clientBloc.getAllClients();
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
                text:
                    "${AppUtils.translate(context, 'all_clients_page_title')}",
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
              child: StreamBuilder<AllClientsResponse>(
                stream: clientBloc.all_clients.stream,
                builder: (context, AsyncSnapshot snapshot) {
                  if (clientBloc.all_clients.value.loading) {
                    return Loader();
                  } else {
                    AllClientsResponse client = snapshot.data;
                    return ListView.separated(
                      itemCount: client.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              GestureDetector(
                                onTap: () {
                                  clientBloc
                                      .addClientToRepresentative(
                                          AddClientToRepresentativeRequest(
                                              userId: client.data[index].id))
                                      .then((value) {
                                    AppUtils.showToast(msg: value.message , bgColor: mainColor);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    child: Text(
                                      "${AppUtils.translate(context, 'all_clients_page_add')}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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
