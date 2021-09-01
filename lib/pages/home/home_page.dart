import 'package:flutter/material.dart';
import 'package:qimma/pages/new/profile_page.dart';

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
      child: Center(child: Text("put your pages here")),
      constraints: BoxConstraints.expand(),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text("you just have to build them and...")),
      constraints: BoxConstraints.expand(),
    ),
    EditProfile()
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
        title: const Text('BottomNavigationBar Sample'),
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
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}