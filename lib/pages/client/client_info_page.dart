import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Bloc/ClientsBloc/client_bloc.dart';
import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:qimma/utils/consts.dart';
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 10,
                  ),
                  Text(
                    "بيانات العملاء",
                    style: TextStyle(fontSize: 20),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    elevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    backgroundColor: secondColor,
                    mini: true,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
              Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: StreamBuilder<AllClientsResponse>(
                      stream: clientBloc.all_clents.stream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (clientBloc.all_clents.value.loading) {
                          return Loader();
                        } else {
                          AllClientsResponse client = snapshot.data;
                          return ListView.separated(
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(client.data[index].firstName ?? ''),
                                              Text(client.data[index].id.toString() ?? ''),
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
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: googleColor,
                                                  ),
                                                  onPressed: () {}),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.money,
                                                  color: mainColor,
                                                ),
                                                onPressed: () {},
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
