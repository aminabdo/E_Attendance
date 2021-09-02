import 'package:flutter/material.dart';
import 'package:qimma/pages/auth/signup_page.dart';
import 'package:qimma/pages/new/attendance_list_page.dart';
import 'package:qimma/pages/new/fingureScreen.dart';

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
      color: Colors.green,
      child: FingPage(),
      constraints: BoxConstraints.expand(),
    ),
    Container(
      color: Colors.green,
      child: AttendanceListPage(),
      constraints: BoxConstraints.expand(),
    ),
    Container(
      color: Colors.green,
      child: SingupPage(),
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
        title: const Text('E Attendance System'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.now_wallpaper_outlined),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}