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
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';
import 'package:qimma/widgets/my_app_bar.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                    // TabBar(
                    //   onTap: (int page) {
                    //     currentIndex = page;
                    //     setState(() {});
                    //   },
                    //   unselectedLabelStyle: TextStyle(color: Colors.black),
                    //   labelColor: mainColor,
                    //   unselectedLabelColor: Colors.black,
                    //   tabs: [
                    //     Tab(
                    //       text: AppUtils.translate(context, 'new_orders'),
                    //     ),
                    //     Tab(
                    //       text: AppUtils.translate(context, 'ongoing_orders'),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            currentIndex == 0 ? NewOrders() : OnGoingOrders()
          ],
        ),
      ),
      drawer: buildDrawer(context, _scaffoldKey),
    );
  }

  Drawer buildDrawer(
      BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            AppUtils.userData?.image != null
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => EditProfile(),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => EditProfile(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                              AppUtils.userData?.image),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                },
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.home_sharp),
                        Text(
                          '${AppUtils.translate(context, 'home_page_title')}',
                          style: TextStyle(color: mainColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppUtils.translate(context, 'change_language')}',
                    style: TextStyle(color: mainColor, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "عربي",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "English",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ClientInfoPage(),
                    ),
                  );
                },
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.notes),
                        Text(
                          '${AppUtils.translate(context, 'clients_info')}',
                          style: TextStyle(color: mainColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget space() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
