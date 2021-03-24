import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qimma/pages/attendance/attendance_page.dart';
import 'package:qimma/pages/client/client_info_page.dart';
import 'package:qimma/pages/client/clients_of_representative.dart';
import 'package:qimma/pages/editProfile/edit_profile.dart';
import 'package:qimma/pages/home/home_page.dart';
import 'package:qimma/pages/products/products_page.dart';
import 'package:qimma/utils/app_utils.dart';
import 'package:qimma/utils/consts.dart';

Drawer buildDrawer(
    BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  return Drawer(
    child: Padding(
      padding: EdgeInsets.only(left: 10, right: 10 , bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5 , right: 5),
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
                        decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
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
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ClientInfoPage(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ClientsOfRepresentativePage(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.notes),
                        Text(
                          '${AppUtils.translate(context, 'all_clients_of_representative_page_title')}',
                          style: TextStyle(color: mainColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ShowAllProducts(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AttendancePage(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.notes),
                        Text(
                          '${AppUtils.translate(context, 'attend_and_leave')}',
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
    ),
  );
}