import 'package:E_Attendance/E_Attendance_user/users_list_page.dart';
import 'package:flutter/material.dart';
import 'package:E_Attendance/E_Attendance_user/attendance_list_page.dart';
import 'package:E_Attendance/E_Attendance_user/fingureScreen.dart';
import 'package:E_Attendance/E_Attendance_user/profile_page.dart';
import 'package:E_Attendance/utils/consts.dart';

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyPages());
  }
}

class MyPages extends StatefulWidget {
  MyPages({Key key}) : super(key: key);

  @override
  MyPagesState createState() => MyPagesState();
}

class MyPagesState extends State<MyPages> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Container(
      color: mainColor,
      child: FingPage(),
      constraints: BoxConstraints.expand(),
    ), // fingure print page
    Container(
      color: mainColor,
      child: AttendanceListPage(),
      constraints: BoxConstraints.expand(),
    ), // attendance list page
    // Container(
    //   color: mainColor,
    //   child: EditProfile(),
    //   constraints: BoxConstraints.expand(),
    // ), // profile page
    Container(
      color: mainColor,
      child: UsersListPage(),
      constraints: BoxConstraints.expand(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SE Attendance System"),
        backgroundColor: mainColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.now_wallpaper_outlined),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "users",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
