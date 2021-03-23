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
import 'package:qimma/widgets/my_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_orders.dart';

class HomePageTest extends StatefulWidget {
  @override
  _HomePageTestState createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
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
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(

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
                      builder: (_) => HomePageTest(),
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
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ShowAllProducts(),
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
                        Icon(Icons.show_chart),
                        Text(
                          '${AppUtils.translate(context, 'show_all_products')}',
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
