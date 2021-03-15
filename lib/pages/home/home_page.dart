import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qimma/main.dart';
import 'package:qimma/pages/auth/login_page.dart';
import 'package:qimma/pages/home/on_going_orders.dart';
import 'package:qimma/pages/notifications/notifications_page.dart';
import 'package:qimma/pages/orders/add_orders_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddOrdersPage(),),);
        },
        backgroundColor: mainColor,
        child: Icon(Icons.add, color: Colors.white,),
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
                      text: '${AppUtils.translate(context, 'hi')}, ${AppUtils.userData?.firstName ?? ''}',
                      leading: AppUtils.userData?.image != null ?
                      CircleAvatar(radius: 25, backgroundImage: CachedNetworkImageProvider(AppUtils.userData?.image),) :
                      Image.asset('assets/images/avatar.jpg', width: 20, height: 20,),
                      actions: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => NotificationsPage(),),);
                          },
                          child: Image.asset('assets/images/notifications.png'),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        GestureDetector(
                          child: Image.asset('assets/images/logout.png'),
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
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
    );
  }

  Widget space() {
    return SizedBox(
      height: MediaQuery.of(context).padding.top,
    );
  }
}
