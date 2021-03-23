import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qimma/Bles/Model/Requests/EditProfileRequest.dart';
import 'package:qimma/main.dart';
import 'package:qimma/pages/auth/login_page.dart';
import 'package:qimma/pages/client/client_info_page.dart';
import 'package:qimma/pages/home/on_going_orders.dart';
import 'package:qimma/pages/notifications/notifications_page.dart';
import 'package:qimma/pages/orders/add_orders_page.dart';
import 'package:qimma/pages/editProfile/edit_profile.dart';
import 'package:qimma/pages/products/products_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
import 'package:qimma/widgets/my_drawer.dart';
import 'package:qimma/widgets/my_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_orders.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffF0F0F0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddOrdersPage(),
            ),
          );
        },
        backgroundColor: mainColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    space(),
                    MyAppBar(
                      text:
                          '${AppUtils.translate(context, 'hi')}, ${AppUtils.userData?.firstName ?? ''}',
                      leading: AppUtils.userData?.image != null
                          ? GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: CachedNetworkImageProvider(
                                    AppUtils.userData?.image),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              child: Image.asset(
                                'assets/images/avatar.jpg',
                                width: 20,
                                height: 20,
                              ),
                            ),
                      actions: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => NotificationsPage(),
                              ),
                            );
                          },
                          child: Image.asset('assets/images/notifications.png'),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        GestureDetector(
                          child: Image.asset('assets/images/logout.png'),
                          onTap: () {
                            AppUtils.removeUserData();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => LoginPage()),
                                (route) => false);
                          },
                        ),
                      ],
                    ),
                    // MyTextFormField(
                    //   hintText: AppUtils.translate(context, 'search_by_id'),
                    //   prefixIcon: Image.asset('assets/images/search.png'),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              color: Colors.white,
              child: TabBar(
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelColor: mainColor,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: AppUtils.translate(context, 'new_orders'),
                  ),
                  Tab(
                    text: AppUtils.translate(context, 'ongoing_orders'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  NewOrders(),
                  OnGoingOrdersPage(),
                ],
              ),
            ),
            //currentIndex == 0 ? NewOrders() : OnGoingOrders()
          ],
        ),
      ),
      drawer: buildDrawer(context, _scaffoldKey),
    );
  }



  Widget space() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
